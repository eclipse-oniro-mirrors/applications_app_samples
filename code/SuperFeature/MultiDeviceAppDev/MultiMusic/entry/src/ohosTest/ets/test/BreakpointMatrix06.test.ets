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

// @volume rule=getValue(k)-returns-numeric-array-field-k-by-reference basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix06Test() {
  describe('BreakpointMatrix06', () => {

    /**
     * @tc.number: SUB_MM_BRKARR01_0100
     * @tc.name: testBrkArr010001
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010001 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([1], [1], [1]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0200
     * @tc.name: testBrkArr010002
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010002 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([2, 4], [2, 4], [2, 4]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0300
     * @tc.name: testBrkArr010003
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010003 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([3, 6, 9], [3, 6, 9], [3, 6, 9]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0400
     * @tc.name: testBrkArr010004
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010004 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0500
     * @tc.name: testBrkArr010005
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010005 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([5], [5], [5]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(5));
      expect(v1).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0600
     * @tc.name: testBrkArr010006
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010006 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([6, 12], [6, 12], [6, 12]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0700
     * @tc.name: testBrkArr010007
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010007 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([7, 14, 21], [7, 14, 21], [7, 14, 21]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0800
     * @tc.name: testBrkArr010008
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010008 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_0900
     * @tc.name: testBrkArr010009
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010009 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([9], [9], [9]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1000
     * @tc.name: testBrkArr010010
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010010 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([10, 20], [10, 20], [10, 20]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(10));
      expect(v1).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1100
     * @tc.name: testBrkArr010011
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010011 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([11, 22, 33], [11, 22, 33], [11, 22, 33]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(11));
      expect(v1).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1200
     * @tc.name: testBrkArr010012
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010012 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1300
     * @tc.name: testBrkArr010013
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010013 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([13], [13], [13]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1400
     * @tc.name: testBrkArr010014
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010014 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([14, 28], [14, 28], [14, 28]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(14));
      expect(v1).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1500
     * @tc.name: testBrkArr010015
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010015 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([15, 30, 45], [15, 30, 45], [15, 30, 45]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1600
     * @tc.name: testBrkArr010016
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010016 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1700
     * @tc.name: testBrkArr010017
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010017 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([17], [17], [17]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(17));
      expect(v1).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1800
     * @tc.name: testBrkArr010018
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010018 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([18, 36], [18, 36], [18, 36]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_1900
     * @tc.name: testBrkArr010019
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010019 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([19, 38, 57], [19, 38, 57], [19, 38, 57]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(19));
      expect(v1).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2000
     * @tc.name: testBrkArr010020
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010020 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2100
     * @tc.name: testBrkArr010021
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010021 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([21], [21], [21]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2200
     * @tc.name: testBrkArr010022
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010022 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([22, 44], [22, 44], [22, 44]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(22));
      expect(v1).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2300
     * @tc.name: testBrkArr010023
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010023 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([23, 46, 69], [23, 46, 69], [23, 46, 69]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(23));
      expect(v1).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2400
     * @tc.name: testBrkArr010024
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010024 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2500
     * @tc.name: testBrkArr010025
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010025 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([25], [25], [25]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(25));
      expect(v1).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2600
     * @tc.name: testBrkArr010026
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010026 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([26, 52], [26, 52], [26, 52]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(26));
      expect(v1).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2700
     * @tc.name: testBrkArr010027
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010027 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([27, 54, 81], [27, 54, 81], [27, 54, 81]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2800
     * @tc.name: testBrkArr010028
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010028 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_2900
     * @tc.name: testBrkArr010029
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010029 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([29], [29], [29]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(29));
      expect(v1).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3000
     * @tc.name: testBrkArr010030
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010030 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([30, 60], [30, 60], [30, 60]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3100
     * @tc.name: testBrkArr010031
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010031 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([31, 62, 93], [31, 62, 93], [31, 62, 93]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(31));
      expect(v1).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3200
     * @tc.name: testBrkArr010032
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010032 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3300
     * @tc.name: testBrkArr010033
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010033 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([33], [33], [33]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3400
     * @tc.name: testBrkArr010034
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010034 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([34, 68], [34, 68], [34, 68]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(34));
      expect(v1).assertEqual(34);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3500
     * @tc.name: testBrkArr010035
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010035 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([35, 70, 105], [35, 70, 105], [35, 70, 105]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(35));
      expect(v1).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3600
     * @tc.name: testBrkArr010036
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010036 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3700
     * @tc.name: testBrkArr010037
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010037 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([37], [37], [37]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(37));
      expect(v1).assertEqual(37);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3800
     * @tc.name: testBrkArr010038
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010038 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([38, 76], [38, 76], [38, 76]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(38));
      expect(v1).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_3900
     * @tc.name: testBrkArr010039
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010039 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([39, 78, 117], [39, 78, 117], [39, 78, 117]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4000
     * @tc.name: testBrkArr010040
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010040 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4100
     * @tc.name: testBrkArr010041
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010041 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([41], [41], [41]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(41));
      expect(v1).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4200
     * @tc.name: testBrkArr010042
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010042 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([42, 84], [42, 84], [42, 84]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4300
     * @tc.name: testBrkArr010043
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010043 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([43, 86, 129], [43, 86, 129], [43, 86, 129]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(43));
      expect(v1).assertEqual(43);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4400
     * @tc.name: testBrkArr010044
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010044 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4500
     * @tc.name: testBrkArr010045
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010045 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([45], [45], [45]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4600
     * @tc.name: testBrkArr010046
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010046 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([46, 92], [46, 92], [46, 92]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(46));
      expect(v1).assertEqual(46);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4700
     * @tc.name: testBrkArr010047
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010047 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([47, 94, 141], [47, 94, 141], [47, 94, 141]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(47));
      expect(v1).assertEqual(47);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4800
     * @tc.name: testBrkArr010048
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010048 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_4900
     * @tc.name: testBrkArr010049
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010049 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([49], [49], [49]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(49));
      expect(v1).assertEqual(49);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5000
     * @tc.name: testBrkArr010050
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010050 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([50, 100], [50, 100], [50, 100]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(50));
      expect(v1).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5100
     * @tc.name: testBrkArr010051
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010051 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([51, 102, 153], [51, 102, 153], [51, 102, 153]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5200
     * @tc.name: testBrkArr010052
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010052 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5300
     * @tc.name: testBrkArr010053
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010053 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([53], [53], [53]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(53));
      expect(v1).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5400
     * @tc.name: testBrkArr010054
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010054 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([54, 108], [54, 108], [54, 108]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5500
     * @tc.name: testBrkArr010055
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010055 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([55, 110, 165], [55, 110, 165], [55, 110, 165]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(55));
      expect(v1).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5600
     * @tc.name: testBrkArr010056
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010056 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5700
     * @tc.name: testBrkArr010057
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010057 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([57], [57], [57]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5800
     * @tc.name: testBrkArr010058
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010058 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([58, 116], [58, 116], [58, 116]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(58));
      expect(v1).assertEqual(58);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_5900
     * @tc.name: testBrkArr010059
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010059 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([59, 118, 177], [59, 118, 177], [59, 118, 177]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(59));
      expect(v1).assertEqual(59);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6000
     * @tc.name: testBrkArr010060
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010060 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6100
     * @tc.name: testBrkArr010061
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010061 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([61], [61], [61]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(61));
      expect(v1).assertEqual(61);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6200
     * @tc.name: testBrkArr010062
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010062 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([62, 124], [62, 124], [62, 124]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(62));
      expect(v1).assertEqual(62);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6300
     * @tc.name: testBrkArr010063
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010063 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([63, 126, 189], [63, 126, 189], [63, 126, 189]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number[] | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6400
     * @tc.name: testBrkArr010064
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010064 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6500
     * @tc.name: testBrkArr010065
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010065 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([65], [65], [65]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(65));
      expect(v1).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6600
     * @tc.name: testBrkArr010066
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010066 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([66, 132], [66, 132], [66, 132]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number[] | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6700
     * @tc.name: testBrkArr010067
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010067 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([67, 134, 201], [67, 134, 201], [67, 134, 201]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(67));
      expect(v1).assertEqual(67);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6800
     * @tc.name: testBrkArr010068
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010068 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'empty-array-length actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_6900
     * @tc.name: testBrkArr010069
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010069 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([69], [69], [69]);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number[] | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7000
     * @tc.name: testBrkArr010070
     * @tc.desc: Verify array type number[] with length 2 is stored and returned per key (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010070 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([70, 140], [70, 140], [70, 140]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(70));
      expect(v1).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7100
     * @tc.name: testBrkArr010071
     * @tc.desc: Verify array type number[] with length 3 is stored and returned per key (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010071 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([71, 142, 213], [71, 142, 213], [71, 142, 213]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(71));
      expect(v1).assertEqual(71);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7200
     * @tc.name: testBrkArr010072
     * @tc.desc: Verify array type number[] with length 0 is stored and returned per key (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010072 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([], [], []);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.length;
      hilog.info(DOMAIN, TAG, 'lg.length actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number[] | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7300
     * @tc.name: testBrkArr010073
     * @tc.desc: Verify array type number[] with length 1 is stored and returned per key (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkArr010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010073 begin');
      let sut: BreakpointType<number[]> = new BreakpointType<number[]>([73], [73], [73]);
      const v0: number = sut.sm.length;
      hilog.info(DOMAIN, TAG, 'sm.length actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v1: number = sut.sm[0];
      hilog.info(DOMAIN, TAG, 'sm[0] actual=%{public}s expected=%{public}s', String(v1), String(73));
      expect(v1).assertEqual(73);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7400
     * @tc.name: testBrkArr010074
     * @tc.desc: Anchor: empty array slot must stay empty and undefined for invalid key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkArr010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010074 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKARR01_7500
     * @tc.name: testBrkArr010075
     * @tc.desc: Anchor: large array boundary keeps length and last element
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkArr010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010075 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkArr010075 end');
    })

  })
}
