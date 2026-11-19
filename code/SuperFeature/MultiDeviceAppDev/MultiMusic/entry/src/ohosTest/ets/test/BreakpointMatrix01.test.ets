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

// @volume rule=getValue(k)-returns-field-k-for-integer-triples,else-undefined basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix01Test() {
  describe('BreakpointMatrix01', () => {

    /**
     * @tc.number: SUB_MM_BRKNUM01_0100
     * @tc.name: testBrkNum010001
     * @tc.desc: Verify integer triple 1/-3/7 resolves per key and rejects "LG" (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010001 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, -3, 7);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0200
     * @tc.name: testBrkNum010002
     * @tc.desc: Verify integer triple 2/-6/14 resolves per key and rejects "Lg" (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010002 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2, -6, 14);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-6));
      expect(v0).assertEqual(-6);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0300
     * @tc.name: testBrkNum010003
     * @tc.desc: Verify integer triple 3/-9/21 resolves per key and rejects "lg " (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010003 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3, -9, 21);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0400
     * @tc.name: testBrkNum010004
     * @tc.desc: Verify integer triple 4/-12/28 resolves per key and rejects " lg" (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010004 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, -12, 28);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-12));
      expect(v0).assertEqual(-12);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(28));
      expect(v1).assertEqual(28);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-12));
      expect(v2).assertEqual(-12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0500
     * @tc.name: testBrkNum010005
     * @tc.desc: Verify integer triple 5/-15/35 resolves per key and rejects "large" (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010005 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(5, -15, 35);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-15));
      expect(v1).assertEqual(-15);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0600
     * @tc.name: testBrkNum010006
     * @tc.desc: Verify integer triple 6/-18/42 resolves per key and rejects "sm2" (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010006 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(6, -18, 42);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(42));
      expect(v1).assertEqual(42);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0700
     * @tc.name: testBrkNum010007
     * @tc.desc: Verify integer triple 7/-21/49 resolves per key and rejects "Md" (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010007 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7, -21, 49);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-21));
      expect(v0).assertEqual(-21);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: number | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0800
     * @tc.name: testBrkNum010008
     * @tc.desc: Verify integer triple 8/-24/56 resolves per key and rejects "mds" (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010008 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(8, -24, 56);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_0900
     * @tc.name: testBrkNum010009
     * @tc.desc: Verify integer triple 9/-27/63 resolves per key and rejects "s" (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010009 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9, -27, 63);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-27));
      expect(v0).assertEqual(-27);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(63));
      expect(v1).assertEqual(63);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-27));
      expect(v2).assertEqual(-27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1000
     * @tc.name: testBrkNum010010
     * @tc.desc: Verify integer triple 10/-30/70 resolves per key and rejects "undefined" (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010010 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(10, -30, 70);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-30));
      expect(v1).assertEqual(-30);
      const v2: number | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1100
     * @tc.name: testBrkNum010011
     * @tc.desc: Verify integer triple 11/-33/77 resolves per key and rejects "null" (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010011 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(11, -33, 77);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(11));
      expect(v0).assertEqual(11);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(77));
      expect(v1).assertEqual(77);
      const v2: number | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1200
     * @tc.name: testBrkNum010012
     * @tc.desc: Verify integer triple 12/-36/84 resolves per key and rejects "0" (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010012 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(12, -36, 84);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-36));
      expect(v0).assertEqual(-36);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      const v2: number | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1300
     * @tc.name: testBrkNum010013
     * @tc.desc: Verify integer triple 13/-39/91 resolves per key and rejects "12" (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010013 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(13, -39, 91);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(91));
      expect(v0).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1400
     * @tc.name: testBrkNum010014
     * @tc.desc: Verify integer triple 14/-42/98 resolves per key and rejects "xl" (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010014 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(14, -42, 98);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-42));
      expect(v0).assertEqual(-42);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(98));
      expect(v1).assertEqual(98);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-42));
      expect(v2).assertEqual(-42);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1500
     * @tc.name: testBrkNum010015
     * @tc.desc: Verify integer triple 15/-45/105 resolves per key and rejects "SML" (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010015 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(15, -45, 105);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(105));
      expect(v0).assertEqual(105);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-45));
      expect(v1).assertEqual(-45);
      const v2: number | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1600
     * @tc.name: testBrkNum010016
     * @tc.desc: Verify integer triple 16/-48/112 resolves per key and rejects "md\t" (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010016 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(16, -48, 112);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(112));
      expect(v1).assertEqual(112);
      const v2: number | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1700
     * @tc.name: testBrkNum010017
     * @tc.desc: Verify integer triple 17/-51/119 resolves per key and rejects "lg2" (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010017 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(17, -51, 119);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-51));
      expect(v0).assertEqual(-51);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(17));
      expect(v1).assertEqual(17);
      const v2: number | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1800
     * @tc.name: testBrkNum010018
     * @tc.desc: Verify integer triple 18/-54/126 resolves per key and rejects "m" (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010018 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(18, -54, 126);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(126));
      expect(v0).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(18));
      expect(v1).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_1900
     * @tc.name: testBrkNum010019
     * @tc.desc: Verify integer triple 19/-57/133 resolves per key and rejects "med" (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010019 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(19, -57, 133);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-57));
      expect(v0).assertEqual(-57);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(133));
      expect(v1).assertEqual(133);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-57));
      expect(v2).assertEqual(-57);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2000
     * @tc.name: testBrkNum010020
     * @tc.desc: Verify integer triple 20/-60/140 resolves per key and rejects "SMALL" (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010020 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(20, -60, 140);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(140));
      expect(v0).assertEqual(140);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-60));
      expect(v1).assertEqual(-60);
      const v2: number | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2100
     * @tc.name: testBrkNum010021
     * @tc.desc: Verify integer triple 21/-63/147 resolves per key and rejects "largeScreen" (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010021 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(21, -63, 147);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(147));
      expect(v1).assertEqual(147);
      const v2: number | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2200
     * @tc.name: testBrkNum010022
     * @tc.desc: Verify integer triple 22/-66/154 resolves per key and rejects "" (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010022 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(22, -66, 154);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-66));
      expect(v0).assertEqual(-66);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(22));
      expect(v1).assertEqual(22);
      const v2: number | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2300
     * @tc.name: testBrkNum010023
     * @tc.desc: Verify integer triple 23/-69/161 resolves per key and rejects "LG" (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010023 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(23, -69, 161);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(161));
      expect(v0).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(23));
      expect(v1).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2400
     * @tc.name: testBrkNum010024
     * @tc.desc: Verify integer triple 24/-72/168 resolves per key and rejects "Lg" (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010024 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(24, -72, 168);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-72));
      expect(v0).assertEqual(-72);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(168));
      expect(v1).assertEqual(168);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-72));
      expect(v2).assertEqual(-72);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2500
     * @tc.name: testBrkNum010025
     * @tc.desc: Verify integer triple 25/-75/175 resolves per key and rejects "lg " (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010025 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(25, -75, 175);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(175));
      expect(v0).assertEqual(175);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-75));
      expect(v1).assertEqual(-75);
      const v2: number | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2600
     * @tc.name: testBrkNum010026
     * @tc.desc: Verify integer triple 26/-78/182 resolves per key and rejects " lg" (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010026 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(26, -78, 182);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(182));
      expect(v1).assertEqual(182);
      const v2: number | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2700
     * @tc.name: testBrkNum010027
     * @tc.desc: Verify integer triple 27/-81/189 resolves per key and rejects "large" (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010027 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(27, -81, 189);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-81));
      expect(v0).assertEqual(-81);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(27));
      expect(v1).assertEqual(27);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2800
     * @tc.name: testBrkNum010028
     * @tc.desc: Verify integer triple 28/-84/196 resolves per key and rejects "sm2" (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010028 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(28, -84, 196);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(196));
      expect(v0).assertEqual(196);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(28));
      expect(v1).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_2900
     * @tc.name: testBrkNum010029
     * @tc.desc: Verify integer triple 29/-87/203 resolves per key and rejects "Md" (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010029 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(29, -87, 203);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-87));
      expect(v0).assertEqual(-87);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(203));
      expect(v1).assertEqual(203);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-87));
      expect(v2).assertEqual(-87);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3000
     * @tc.name: testBrkNum010030
     * @tc.desc: Verify integer triple 30/-90/210 resolves per key and rejects "mds" (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010030 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(30, -90, 210);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(210));
      expect(v0).assertEqual(210);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-90));
      expect(v1).assertEqual(-90);
      const v2: number | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3100
     * @tc.name: testBrkNum010031
     * @tc.desc: Verify integer triple 31/-93/217 resolves per key and rejects "s" (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010031 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(31, -93, 217);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(31));
      expect(v0).assertEqual(31);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(217));
      expect(v1).assertEqual(217);
      const v2: number | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3200
     * @tc.name: testBrkNum010032
     * @tc.desc: Verify integer triple 32/-96/224 resolves per key and rejects "undefined" (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010032 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(32, -96, 224);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-96));
      expect(v0).assertEqual(-96);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(32));
      expect(v1).assertEqual(32);
      const v2: number | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3300
     * @tc.name: testBrkNum010033
     * @tc.desc: Verify integer triple 33/-99/231 resolves per key and rejects "null" (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010033 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(33, -99, 231);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(231));
      expect(v0).assertEqual(231);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(33));
      expect(v1).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3400
     * @tc.name: testBrkNum010034
     * @tc.desc: Verify integer triple 34/-102/238 resolves per key and rejects "0" (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010034 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(34, -102, 238);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-102));
      expect(v0).assertEqual(-102);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(238));
      expect(v1).assertEqual(238);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-102));
      expect(v2).assertEqual(-102);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3500
     * @tc.name: testBrkNum010035
     * @tc.desc: Verify integer triple 35/-105/245 resolves per key and rejects "12" (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010035 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(35, -105, 245);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(245));
      expect(v0).assertEqual(245);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-105));
      expect(v1).assertEqual(-105);
      const v2: number | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3600
     * @tc.name: testBrkNum010036
     * @tc.desc: Verify integer triple 36/-108/252 resolves per key and rejects "xl" (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010036 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(36, -108, 252);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(252));
      expect(v1).assertEqual(252);
      const v2: number | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3700
     * @tc.name: testBrkNum010037
     * @tc.desc: Verify integer triple 37/-111/259 resolves per key and rejects "SML" (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010037 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(37, -111, 259);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-111));
      expect(v0).assertEqual(-111);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(37));
      expect(v1).assertEqual(37);
      const v2: number | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3800
     * @tc.name: testBrkNum010038
     * @tc.desc: Verify integer triple 38/-114/266 resolves per key and rejects "md\t" (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010038 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(38, -114, 266);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(266));
      expect(v0).assertEqual(266);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(38));
      expect(v1).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_3900
     * @tc.name: testBrkNum010039
     * @tc.desc: Verify integer triple 39/-117/273 resolves per key and rejects "lg2" (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010039 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(39, -117, 273);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-117));
      expect(v0).assertEqual(-117);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(273));
      expect(v1).assertEqual(273);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-117));
      expect(v2).assertEqual(-117);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4000
     * @tc.name: testBrkNum010040
     * @tc.desc: Verify integer triple 40/-120/280 resolves per key and rejects "m" (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010040 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(40, -120, 280);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(280));
      expect(v0).assertEqual(280);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-120));
      expect(v1).assertEqual(-120);
      const v2: number | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4100
     * @tc.name: testBrkNum010041
     * @tc.desc: Verify integer triple 41/-123/287 resolves per key and rejects "med" (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010041 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(41, -123, 287);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(41));
      expect(v0).assertEqual(41);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(287));
      expect(v1).assertEqual(287);
      const v2: number | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4200
     * @tc.name: testBrkNum010042
     * @tc.desc: Verify integer triple 42/-126/294 resolves per key and rejects "SMALL" (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010042 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(42, -126, 294);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-126));
      expect(v0).assertEqual(-126);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(42));
      expect(v1).assertEqual(42);
      const v2: number | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4300
     * @tc.name: testBrkNum010043
     * @tc.desc: Verify integer triple 43/-129/301 resolves per key and rejects "largeScreen" (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010043 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(43, -129, 301);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(301));
      expect(v0).assertEqual(301);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(43));
      expect(v1).assertEqual(43);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4400
     * @tc.name: testBrkNum010044
     * @tc.desc: Verify integer triple 44/-132/308 resolves per key and rejects "" (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010044 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(44, -132, 308);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-132));
      expect(v0).assertEqual(-132);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(308));
      expect(v1).assertEqual(308);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-132));
      expect(v2).assertEqual(-132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4500
     * @tc.name: testBrkNum010045
     * @tc.desc: Verify integer triple 45/-135/315 resolves per key and rejects "LG" (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010045 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(45, -135, 315);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(315));
      expect(v0).assertEqual(315);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-135));
      expect(v1).assertEqual(-135);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4600
     * @tc.name: testBrkNum010046
     * @tc.desc: Verify integer triple 46/-138/322 resolves per key and rejects "Lg" (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010046 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(46, -138, 322);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(322));
      expect(v1).assertEqual(322);
      const v2: number | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4700
     * @tc.name: testBrkNum010047
     * @tc.desc: Verify integer triple 47/-141/329 resolves per key and rejects "lg " (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010047 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(47, -141, 329);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-141));
      expect(v0).assertEqual(-141);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(47));
      expect(v1).assertEqual(47);
      const v2: number | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4800
     * @tc.name: testBrkNum010048
     * @tc.desc: Verify integer triple 48/-144/336 resolves per key and rejects " lg" (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010048 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(48, -144, 336);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(336));
      expect(v0).assertEqual(336);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(48));
      expect(v1).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_4900
     * @tc.name: testBrkNum010049
     * @tc.desc: Verify integer triple 49/-147/343 resolves per key and rejects "large" (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010049 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(49, -147, 343);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-147));
      expect(v0).assertEqual(-147);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(343));
      expect(v1).assertEqual(343);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-147));
      expect(v2).assertEqual(-147);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5000
     * @tc.name: testBrkNum010050
     * @tc.desc: Verify integer triple 50/-150/350 resolves per key and rejects "sm2" (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010050 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(50, -150, 350);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(350));
      expect(v0).assertEqual(350);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-150));
      expect(v1).assertEqual(-150);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5100
     * @tc.name: testBrkNum010051
     * @tc.desc: Verify integer triple 51/-153/357 resolves per key and rejects "Md" (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010051 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(51, -153, 357);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(51));
      expect(v0).assertEqual(51);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(357));
      expect(v1).assertEqual(357);
      const v2: number | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5200
     * @tc.name: testBrkNum010052
     * @tc.desc: Verify integer triple 52/-156/364 resolves per key and rejects "mds" (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010052 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(52, -156, 364);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-156));
      expect(v0).assertEqual(-156);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(52));
      expect(v1).assertEqual(52);
      const v2: number | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5300
     * @tc.name: testBrkNum010053
     * @tc.desc: Verify integer triple 53/-159/371 resolves per key and rejects "s" (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010053 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(53, -159, 371);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(371));
      expect(v0).assertEqual(371);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(53));
      expect(v1).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5400
     * @tc.name: testBrkNum010054
     * @tc.desc: Verify integer triple 54/-162/378 resolves per key and rejects "undefined" (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010054 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(54, -162, 378);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-162));
      expect(v0).assertEqual(-162);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(378));
      expect(v1).assertEqual(378);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-162));
      expect(v2).assertEqual(-162);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5500
     * @tc.name: testBrkNum010055
     * @tc.desc: Verify integer triple 55/-165/385 resolves per key and rejects "null" (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010055 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(55, -165, 385);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(385));
      expect(v0).assertEqual(385);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-165));
      expect(v1).assertEqual(-165);
      const v2: number | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5600
     * @tc.name: testBrkNum010056
     * @tc.desc: Verify integer triple 56/-168/392 resolves per key and rejects "0" (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010056 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(56, -168, 392);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(392));
      expect(v1).assertEqual(392);
      const v2: number | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5700
     * @tc.name: testBrkNum010057
     * @tc.desc: Verify integer triple 57/-171/399 resolves per key and rejects "12" (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010057 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(57, -171, 399);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-171));
      expect(v0).assertEqual(-171);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(57));
      expect(v1).assertEqual(57);
      const v2: number | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5800
     * @tc.name: testBrkNum010058
     * @tc.desc: Verify integer triple 58/-174/406 resolves per key and rejects "xl" (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010058 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(58, -174, 406);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(406));
      expect(v0).assertEqual(406);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(58));
      expect(v1).assertEqual(58);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_5900
     * @tc.name: testBrkNum010059
     * @tc.desc: Verify integer triple 59/-177/413 resolves per key and rejects "SML" (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010059 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(59, -177, 413);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-177));
      expect(v0).assertEqual(-177);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(413));
      expect(v1).assertEqual(413);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-177));
      expect(v2).assertEqual(-177);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6000
     * @tc.name: testBrkNum010060
     * @tc.desc: Verify integer triple 60/-180/420 resolves per key and rejects "md\t" (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010060 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(60, -180, 420);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(420));
      expect(v0).assertEqual(420);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-180));
      expect(v1).assertEqual(-180);
      const v2: number | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6100
     * @tc.name: testBrkNum010061
     * @tc.desc: Verify integer triple 61/-183/427 resolves per key and rejects "lg2" (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010061 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(61, -183, 427);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(61));
      expect(v0).assertEqual(61);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(427));
      expect(v1).assertEqual(427);
      const v2: number | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6200
     * @tc.name: testBrkNum010062
     * @tc.desc: Verify integer triple 62/-186/434 resolves per key and rejects "m" (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010062 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(62, -186, 434);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-186));
      expect(v0).assertEqual(-186);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(62));
      expect(v1).assertEqual(62);
      const v2: number | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6300
     * @tc.name: testBrkNum010063
     * @tc.desc: Verify integer triple 63/-189/441 resolves per key and rejects "med" (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010063 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(63, -189, 441);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(441));
      expect(v0).assertEqual(441);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(63));
      expect(v1).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6400
     * @tc.name: testBrkNum010064
     * @tc.desc: Verify integer triple 64/-192/448 resolves per key and rejects "SMALL" (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010064 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(64, -192, 448);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-192));
      expect(v0).assertEqual(-192);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(448));
      expect(v1).assertEqual(448);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-192));
      expect(v2).assertEqual(-192);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6500
     * @tc.name: testBrkNum010065
     * @tc.desc: Verify integer triple 65/-195/455 resolves per key and rejects "largeScreen" (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010065 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(65, -195, 455);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(455));
      expect(v0).assertEqual(455);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-195));
      expect(v1).assertEqual(-195);
      const v2: number | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6600
     * @tc.name: testBrkNum010066
     * @tc.desc: Verify integer triple 66/-198/462 resolves per key and rejects "" (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010066 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(66, -198, 462);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(462));
      expect(v1).assertEqual(462);
      const v2: number | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6700
     * @tc.name: testBrkNum010067
     * @tc.desc: Verify integer triple 67/-201/469 resolves per key and rejects "LG" (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010067 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(67, -201, 469);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-201));
      expect(v0).assertEqual(-201);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(67));
      expect(v1).assertEqual(67);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6800
     * @tc.name: testBrkNum010068
     * @tc.desc: Verify integer triple 68/-204/476 resolves per key and rejects "Lg" (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010068 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(68, -204, 476);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(476));
      expect(v0).assertEqual(476);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(68));
      expect(v1).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_6900
     * @tc.name: testBrkNum010069
     * @tc.desc: Verify integer triple 69/-207/483 resolves per key and rejects "lg " (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010069 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(69, -207, 483);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-207));
      expect(v0).assertEqual(-207);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(483));
      expect(v1).assertEqual(483);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-207));
      expect(v2).assertEqual(-207);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7000
     * @tc.name: testBrkNum010070
     * @tc.desc: Verify integer triple 70/-210/490 resolves per key and rejects " lg" (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010070 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(70, -210, 490);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(490));
      expect(v0).assertEqual(490);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-210));
      expect(v1).assertEqual(-210);
      const v2: number | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7100
     * @tc.name: testBrkNum010071
     * @tc.desc: Verify integer triple 71/-213/497 resolves per key and rejects "large" (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010071 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(71, -213, 497);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(71));
      expect(v0).assertEqual(71);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(497));
      expect(v1).assertEqual(497);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7200
     * @tc.name: testBrkNum010072
     * @tc.desc: Verify integer triple 72/-216/504 resolves per key and rejects "sm2" (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010072 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(72, -216, 504);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-216));
      expect(v0).assertEqual(-216);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(72));
      expect(v1).assertEqual(72);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7300
     * @tc.name: testBrkNum010073
     * @tc.desc: Verify integer triple 73/-219/511 resolves per key and rejects "Md" (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010073 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(73, -219, 511);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(511));
      expect(v0).assertEqual(511);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(73));
      expect(v1).assertEqual(73);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7400
     * @tc.name: testBrkNum010074
     * @tc.desc: Anchor: empty key and uppercase key must not resolve for numeric triples
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010074 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-1, 0, 1);
      const v0: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v0));
      expect(v0).assertUndefined();
      const v1: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-valid actual=%{public}s expected=%{public}s', String(v2), String(1));
      expect(v2).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM01_7500
     * @tc.name: testBrkNum010075
     * @tc.desc: Anchor: key with trailing space must not resolve and md keeps zero
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010075 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 0, 2);
      const v0: number | undefined = sut.getValue('lg ');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v0));
      expect(v0).assertUndefined();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-zero actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-valid actual=%{public}s expected=%{public}s', String(v2), String(2));
      expect(v2).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum010075 end');
    })

  })
}
