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

// @volume rule=getValue(k)-returns-string-array-field-k-by-reference basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix07Test() {
  describe('BreakpointMatrix07', () => {

    /**
     * @tc.number: SUB_MM_BRKARR02_0100
     * @tc.name: testBrkArr020001
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020001 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s1_0"], ["s1_0"], ["s1_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s1_0"));
      expect(v1).assertEqual("s1_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0200
     * @tc.name: testBrkArr020002
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020002 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s2_0", "s2_1"], ["s2_0", "s2_1"], ["s2_0", "s2_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s2_0"));
      expect(v1).assertEqual("s2_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0300
     * @tc.name: testBrkArr020003
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020003 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s3_0", "s3_1", "s3_2"], ["s3_0", "s3_1", "s3_2"], ["s3_0", "s3_1", "s3_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0400
     * @tc.name: testBrkArr020004
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020004 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0500
     * @tc.name: testBrkArr020005
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020005 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s5_0"], ["s5_0"], ["s5_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s5_0"));
      expect(v1).assertEqual("s5_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0600
     * @tc.name: testBrkArr020006
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020006 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s6_0", "s6_1"], ["s6_0", "s6_1"], ["s6_0", "s6_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0700
     * @tc.name: testBrkArr020007
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020007 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s7_0", "s7_1", "s7_2"], ["s7_0", "s7_1", "s7_2"], ["s7_0", "s7_1", "s7_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s7_0"));
      expect(v1).assertEqual("s7_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0800
     * @tc.name: testBrkArr020008
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020008 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_0900
     * @tc.name: testBrkArr020009
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020009 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s9_0"], ["s9_0"], ["s9_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1000
     * @tc.name: testBrkArr020010
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020010 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s10_0", "s10_1"], ["s10_0", "s10_1"], ["s10_0", "s10_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s10_0"));
      expect(v1).assertEqual("s10_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1100
     * @tc.name: testBrkArr020011
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020011 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s11_0", "s11_1", "s11_2"], ["s11_0", "s11_1", "s11_2"], ["s11_0", "s11_1", "s11_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s11_0"));
      expect(v1).assertEqual("s11_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1200
     * @tc.name: testBrkArr020012
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020012 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1300
     * @tc.name: testBrkArr020013
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020013 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s13_0"], ["s13_0"], ["s13_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s13_0"));
      expect(v1).assertEqual("s13_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1400
     * @tc.name: testBrkArr020014
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020014 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s14_0", "s14_1"], ["s14_0", "s14_1"], ["s14_0", "s14_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s14_0"));
      expect(v1).assertEqual("s14_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1500
     * @tc.name: testBrkArr020015
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020015 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s15_0", "s15_1", "s15_2"], ["s15_0", "s15_1", "s15_2"], ["s15_0", "s15_1", "s15_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1600
     * @tc.name: testBrkArr020016
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020016 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1700
     * @tc.name: testBrkArr020017
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020017 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s17_0"], ["s17_0"], ["s17_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s17_0"));
      expect(v1).assertEqual("s17_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1800
     * @tc.name: testBrkArr020018
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020018 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s18_0", "s18_1"], ["s18_0", "s18_1"], ["s18_0", "s18_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_1900
     * @tc.name: testBrkArr020019
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020019 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s19_0", "s19_1", "s19_2"], ["s19_0", "s19_1", "s19_2"], ["s19_0", "s19_1", "s19_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s19_0"));
      expect(v1).assertEqual("s19_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2000
     * @tc.name: testBrkArr020020
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020020 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2100
     * @tc.name: testBrkArr020021
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020021 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s21_0"], ["s21_0"], ["s21_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2200
     * @tc.name: testBrkArr020022
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020022 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s22_0", "s22_1"], ["s22_0", "s22_1"], ["s22_0", "s22_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s22_0"));
      expect(v1).assertEqual("s22_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2300
     * @tc.name: testBrkArr020023
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020023 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s23_0", "s23_1", "s23_2"], ["s23_0", "s23_1", "s23_2"], ["s23_0", "s23_1", "s23_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s23_0"));
      expect(v1).assertEqual("s23_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2400
     * @tc.name: testBrkArr020024
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020024 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2500
     * @tc.name: testBrkArr020025
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020025 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s25_0"], ["s25_0"], ["s25_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s25_0"));
      expect(v1).assertEqual("s25_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2600
     * @tc.name: testBrkArr020026
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020026 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s26_0", "s26_1"], ["s26_0", "s26_1"], ["s26_0", "s26_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s26_0"));
      expect(v1).assertEqual("s26_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2700
     * @tc.name: testBrkArr020027
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020027 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s27_0", "s27_1", "s27_2"], ["s27_0", "s27_1", "s27_2"], ["s27_0", "s27_1", "s27_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2800
     * @tc.name: testBrkArr020028
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020028 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_2900
     * @tc.name: testBrkArr020029
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020029 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s29_0"], ["s29_0"], ["s29_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s29_0"));
      expect(v1).assertEqual("s29_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3000
     * @tc.name: testBrkArr020030
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020030 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s30_0", "s30_1"], ["s30_0", "s30_1"], ["s30_0", "s30_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3100
     * @tc.name: testBrkArr020031
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020031 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s31_0", "s31_1", "s31_2"], ["s31_0", "s31_1", "s31_2"], ["s31_0", "s31_1", "s31_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s31_0"));
      expect(v1).assertEqual("s31_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3200
     * @tc.name: testBrkArr020032
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020032 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3300
     * @tc.name: testBrkArr020033
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020033 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s33_0"], ["s33_0"], ["s33_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3400
     * @tc.name: testBrkArr020034
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020034 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s34_0", "s34_1"], ["s34_0", "s34_1"], ["s34_0", "s34_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s34_0"));
      expect(v1).assertEqual("s34_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3500
     * @tc.name: testBrkArr020035
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020035 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s35_0", "s35_1", "s35_2"], ["s35_0", "s35_1", "s35_2"], ["s35_0", "s35_1", "s35_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s35_0"));
      expect(v1).assertEqual("s35_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3600
     * @tc.name: testBrkArr020036
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020036 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3700
     * @tc.name: testBrkArr020037
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020037 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s37_0"], ["s37_0"], ["s37_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s37_0"));
      expect(v1).assertEqual("s37_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3800
     * @tc.name: testBrkArr020038
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020038 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s38_0", "s38_1"], ["s38_0", "s38_1"], ["s38_0", "s38_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s38_0"));
      expect(v1).assertEqual("s38_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_3900
     * @tc.name: testBrkArr020039
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020039 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s39_0", "s39_1", "s39_2"], ["s39_0", "s39_1", "s39_2"], ["s39_0", "s39_1", "s39_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4000
     * @tc.name: testBrkArr020040
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020040 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4100
     * @tc.name: testBrkArr020041
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020041 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s41_0"], ["s41_0"], ["s41_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s41_0"));
      expect(v1).assertEqual("s41_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4200
     * @tc.name: testBrkArr020042
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020042 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s42_0", "s42_1"], ["s42_0", "s42_1"], ["s42_0", "s42_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4300
     * @tc.name: testBrkArr020043
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020043 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s43_0", "s43_1", "s43_2"], ["s43_0", "s43_1", "s43_2"], ["s43_0", "s43_1", "s43_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s43_0"));
      expect(v1).assertEqual("s43_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4400
     * @tc.name: testBrkArr020044
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020044 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4500
     * @tc.name: testBrkArr020045
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020045 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s45_0"], ["s45_0"], ["s45_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4600
     * @tc.name: testBrkArr020046
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020046 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s46_0", "s46_1"], ["s46_0", "s46_1"], ["s46_0", "s46_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s46_0"));
      expect(v1).assertEqual("s46_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4700
     * @tc.name: testBrkArr020047
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020047 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s47_0", "s47_1", "s47_2"], ["s47_0", "s47_1", "s47_2"], ["s47_0", "s47_1", "s47_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s47_0"));
      expect(v1).assertEqual("s47_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4800
     * @tc.name: testBrkArr020048
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020048 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_4900
     * @tc.name: testBrkArr020049
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020049 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s49_0"], ["s49_0"], ["s49_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s49_0"));
      expect(v1).assertEqual("s49_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5000
     * @tc.name: testBrkArr020050
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020050 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s50_0", "s50_1"], ["s50_0", "s50_1"], ["s50_0", "s50_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s50_0"));
      expect(v1).assertEqual("s50_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5100
     * @tc.name: testBrkArr020051
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020051 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s51_0", "s51_1", "s51_2"], ["s51_0", "s51_1", "s51_2"], ["s51_0", "s51_1", "s51_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5200
     * @tc.name: testBrkArr020052
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020052 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5300
     * @tc.name: testBrkArr020053
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020053 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s53_0"], ["s53_0"], ["s53_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s53_0"));
      expect(v1).assertEqual("s53_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5400
     * @tc.name: testBrkArr020054
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020054 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s54_0", "s54_1"], ["s54_0", "s54_1"], ["s54_0", "s54_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5500
     * @tc.name: testBrkArr020055
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020055 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s55_0", "s55_1", "s55_2"], ["s55_0", "s55_1", "s55_2"], ["s55_0", "s55_1", "s55_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s55_0"));
      expect(v1).assertEqual("s55_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5600
     * @tc.name: testBrkArr020056
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020056 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5700
     * @tc.name: testBrkArr020057
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020057 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s57_0"], ["s57_0"], ["s57_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5800
     * @tc.name: testBrkArr020058
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020058 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s58_0", "s58_1"], ["s58_0", "s58_1"], ["s58_0", "s58_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s58_0"));
      expect(v1).assertEqual("s58_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_5900
     * @tc.name: testBrkArr020059
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020059 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s59_0", "s59_1", "s59_2"], ["s59_0", "s59_1", "s59_2"], ["s59_0", "s59_1", "s59_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s59_0"));
      expect(v1).assertEqual("s59_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6000
     * @tc.name: testBrkArr020060
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020060 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6100
     * @tc.name: testBrkArr020061
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020061 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s61_0"], ["s61_0"], ["s61_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s61_0"));
      expect(v1).assertEqual("s61_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6200
     * @tc.name: testBrkArr020062
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020062 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s62_0", "s62_1"], ["s62_0", "s62_1"], ["s62_0", "s62_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s62_0"));
      expect(v1).assertEqual("s62_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6300
     * @tc.name: testBrkArr020063
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020063 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s63_0", "s63_1", "s63_2"], ["s63_0", "s63_1", "s63_2"], ["s63_0", "s63_1", "s63_2"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: string[] | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6400
     * @tc.name: testBrkArr020064
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020064 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6500
     * @tc.name: testBrkArr020065
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020065 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s65_0"], ["s65_0"], ["s65_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s65_0"));
      expect(v1).assertEqual("s65_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6600
     * @tc.name: testBrkArr020066
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020066 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s66_0", "s66_1"], ["s66_0", "s66_1"], ["s66_0", "s66_1"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string[] | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6700
     * @tc.name: testBrkArr020067
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020067 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s67_0", "s67_1", "s67_2"], ["s67_0", "s67_1", "s67_2"], ["s67_0", "s67_1", "s67_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s67_0"));
      expect(v1).assertEqual("s67_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6800
     * @tc.name: testBrkArr020068
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020068 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_6900
     * @tc.name: testBrkArr020069
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020069 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s69_0"], ["s69_0"], ["s69_0"]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: string[] | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7000
     * @tc.name: testBrkArr020070
     * @tc.desc: Verify array type string[] with length 2 is stored and returned per key (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020070 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s70_0", "s70_1"], ["s70_0", "s70_1"], ["s70_0", "s70_1"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s70_0"));
      expect(v1).assertEqual("s70_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7100
     * @tc.name: testBrkArr020071
     * @tc.desc: Verify array type string[] with length 3 is stored and returned per key (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020071 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s71_0", "s71_1", "s71_2"], ["s71_0", "s71_1", "s71_2"], ["s71_0", "s71_1", "s71_2"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s71_0"));
      expect(v1).assertEqual("s71_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7200
     * @tc.name: testBrkArr020072
     * @tc.desc: Verify array type string[] with length 0 is stored and returned per key (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020072 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: string[] | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7300
     * @tc.name: testBrkArr020073
     * @tc.desc: Verify array type string[] with length 1 is stored and returned per key (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020073 begin');
      let sut: BreakpointType<string[]> = new BreakpointType<string[]>(["s73_0"], ["s73_0"], ["s73_0"]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: string = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String("s73_0"));
      expect(v1).assertEqual("s73_0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7400
     * @tc.name: testBrkArr020074
     * @tc.desc: Anchor: large array boundary keeps length and last element
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkArr020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020074 begin');
      let big: number[] = [];
      for (let i = 0; i < 100; i++) {
        big.push(i);
      }
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>(big, big, big);
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg-length actual=%{public}s expected=%{public}s', String(v0), String(100));
      expect(v0).assertEqual(100);
      const v1: number = sut.lg[99];
      hilog.info(DOMAIN, TAG, 'lg-last actual=%{public}s expected=%{public}s', String(v1), String(99));
      expect(v1).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR02_7500
     * @tc.name: testBrkArr020075
     * @tc.desc: Anchor: empty array slot must stay empty and undefined for invalid key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkArr020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020075 begin');
      let empty: number[] = [];
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>(empty, [1], [2]);
      hilog.info(DOMAIN, TAG, 'sm-keeps-empty-reference actual=%{public}s expected=true', String(sut.getValue('sm') === empty));
      expect(sut.getValue('sm') === empty).assertTrue();
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm-length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr020075 end');
    })

  })
}
