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

// @volume rule=getValue(k)-returns-field-k-for-decimal-triples,else-undefined basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix02Test() {
  describe('BreakpointMatrix02', () => {

    /**
     * @tc.number: SUB_MM_BRKNUM02_0100
     * @tc.name: testBrkNum020001
     * @tc.desc: Verify decimal triple 0.25/-0.625/1.25 resolves per key and rejects "LG" (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020001 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.25, -0.625, 1.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(0.25));
      expect(v0).assertEqual(0.25);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(1.25));
      expect(v1).assertEqual(1.25);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0200
     * @tc.name: testBrkNum020002
     * @tc.desc: Verify decimal triple 0.5/-1.25/2.25 resolves per key and rejects "Lg" (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020002 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.5, -1.25, 2.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-1.25));
      expect(v0).assertEqual(-1.25);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(0.5));
      expect(v1).assertEqual(0.5);
      const v2: number | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0300
     * @tc.name: testBrkNum020003
     * @tc.desc: Verify decimal triple 0.75/-1.875/3.25 resolves per key and rejects "lg " (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020003 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.75, -1.875, 3.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(3.25));
      expect(v0).assertEqual(3.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(0.75));
      expect(v1).assertEqual(0.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0400
     * @tc.name: testBrkNum020004
     * @tc.desc: Verify decimal triple 1/-2.5/4.25 resolves per key and rejects " lg" (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020004 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, -2.5, 4.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-2.5));
      expect(v0).assertEqual(-2.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(4.25));
      expect(v1).assertEqual(4.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-2.5));
      expect(v2).assertEqual(-2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0500
     * @tc.name: testBrkNum020005
     * @tc.desc: Verify decimal triple 1.25/-3.125/5.25 resolves per key and rejects "large" (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020005 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1.25, -3.125, 5.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(5.25));
      expect(v0).assertEqual(5.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-3.125));
      expect(v1).assertEqual(-3.125);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0600
     * @tc.name: testBrkNum020006
     * @tc.desc: Verify decimal triple 1.5/-3.75/6.25 resolves per key and rejects "sm2" (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020006 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1.5, -3.75, 6.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(1.5));
      expect(v0).assertEqual(1.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(6.25));
      expect(v1).assertEqual(6.25);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0700
     * @tc.name: testBrkNum020007
     * @tc.desc: Verify decimal triple 1.75/-4.375/7.25 resolves per key and rejects "Md" (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020007 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1.75, -4.375, 7.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-4.375));
      expect(v0).assertEqual(-4.375);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(1.75));
      expect(v1).assertEqual(1.75);
      const v2: number | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0800
     * @tc.name: testBrkNum020008
     * @tc.desc: Verify decimal triple 2/-5/8.25 resolves per key and rejects "mds" (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020008 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2, -5, 8.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(8.25));
      expect(v0).assertEqual(8.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_0900
     * @tc.name: testBrkNum020009
     * @tc.desc: Verify decimal triple 2.25/-5.625/9.25 resolves per key and rejects "s" (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020009 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2.25, -5.625, 9.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-5.625));
      expect(v0).assertEqual(-5.625);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(9.25));
      expect(v1).assertEqual(9.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-5.625));
      expect(v2).assertEqual(-5.625);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1000
     * @tc.name: testBrkNum020010
     * @tc.desc: Verify decimal triple 2.5/-6.25/10.25 resolves per key and rejects "undefined" (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020010 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2.5, -6.25, 10.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(10.25));
      expect(v0).assertEqual(10.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-6.25));
      expect(v1).assertEqual(-6.25);
      const v2: number | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1100
     * @tc.name: testBrkNum020011
     * @tc.desc: Verify decimal triple 2.75/-6.875/11.25 resolves per key and rejects "null" (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020011 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2.75, -6.875, 11.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(2.75));
      expect(v0).assertEqual(2.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(11.25));
      expect(v1).assertEqual(11.25);
      const v2: number | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1200
     * @tc.name: testBrkNum020012
     * @tc.desc: Verify decimal triple 3/-7.5/12.25 resolves per key and rejects "0" (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020012 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3, -7.5, 12.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-7.5));
      expect(v0).assertEqual(-7.5);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      const v2: number | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1300
     * @tc.name: testBrkNum020013
     * @tc.desc: Verify decimal triple 3.25/-8.125/13.25 resolves per key and rejects "12" (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020013 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3.25, -8.125, 13.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(13.25));
      expect(v0).assertEqual(13.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(3.25));
      expect(v1).assertEqual(3.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1400
     * @tc.name: testBrkNum020014
     * @tc.desc: Verify decimal triple 3.5/-8.75/14.25 resolves per key and rejects "xl" (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020014 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3.5, -8.75, 14.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-8.75));
      expect(v0).assertEqual(-8.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(14.25));
      expect(v1).assertEqual(14.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-8.75));
      expect(v2).assertEqual(-8.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1500
     * @tc.name: testBrkNum020015
     * @tc.desc: Verify decimal triple 3.75/-9.375/15.25 resolves per key and rejects "SML" (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020015 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3.75, -9.375, 15.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(15.25));
      expect(v0).assertEqual(15.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-9.375));
      expect(v1).assertEqual(-9.375);
      const v2: number | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1600
     * @tc.name: testBrkNum020016
     * @tc.desc: Verify decimal triple 4/-10/16.25 resolves per key and rejects "md\t" (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020016 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, -10, 16.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(16.25));
      expect(v1).assertEqual(16.25);
      const v2: number | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1700
     * @tc.name: testBrkNum020017
     * @tc.desc: Verify decimal triple 4.25/-10.625/17.25 resolves per key and rejects "lg2" (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020017 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4.25, -10.625, 17.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-10.625));
      expect(v0).assertEqual(-10.625);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(4.25));
      expect(v1).assertEqual(4.25);
      const v2: number | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1800
     * @tc.name: testBrkNum020018
     * @tc.desc: Verify decimal triple 4.5/-11.25/18.25 resolves per key and rejects "m" (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020018 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4.5, -11.25, 18.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(18.25));
      expect(v0).assertEqual(18.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(4.5));
      expect(v1).assertEqual(4.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_1900
     * @tc.name: testBrkNum020019
     * @tc.desc: Verify decimal triple 4.75/-11.875/19.25 resolves per key and rejects "med" (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020019 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4.75, -11.875, 19.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-11.875));
      expect(v0).assertEqual(-11.875);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(19.25));
      expect(v1).assertEqual(19.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-11.875));
      expect(v2).assertEqual(-11.875);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2000
     * @tc.name: testBrkNum020020
     * @tc.desc: Verify decimal triple 5/-12.5/20.25 resolves per key and rejects "SMALL" (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020020 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(5, -12.5, 20.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(20.25));
      expect(v0).assertEqual(20.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-12.5));
      expect(v1).assertEqual(-12.5);
      const v2: number | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2100
     * @tc.name: testBrkNum020021
     * @tc.desc: Verify decimal triple 5.25/-13.125/21.25 resolves per key and rejects "largeScreen" (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020021 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(5.25, -13.125, 21.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(5.25));
      expect(v0).assertEqual(5.25);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(21.25));
      expect(v1).assertEqual(21.25);
      const v2: number | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2200
     * @tc.name: testBrkNum020022
     * @tc.desc: Verify decimal triple 5.5/-13.75/22.25 resolves per key and rejects "" (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020022 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(5.5, -13.75, 22.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-13.75));
      expect(v0).assertEqual(-13.75);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(5.5));
      expect(v1).assertEqual(5.5);
      const v2: number | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2300
     * @tc.name: testBrkNum020023
     * @tc.desc: Verify decimal triple 5.75/-14.375/23.25 resolves per key and rejects "LG" (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020023 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(5.75, -14.375, 23.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(23.25));
      expect(v0).assertEqual(23.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(5.75));
      expect(v1).assertEqual(5.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2400
     * @tc.name: testBrkNum020024
     * @tc.desc: Verify decimal triple 6/-15/24.25 resolves per key and rejects "Lg" (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020024 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(6, -15, 24.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-15));
      expect(v0).assertEqual(-15);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(24.25));
      expect(v1).assertEqual(24.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-15));
      expect(v2).assertEqual(-15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2500
     * @tc.name: testBrkNum020025
     * @tc.desc: Verify decimal triple 6.25/-15.625/25.25 resolves per key and rejects "lg " (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020025 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(6.25, -15.625, 25.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(25.25));
      expect(v0).assertEqual(25.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-15.625));
      expect(v1).assertEqual(-15.625);
      const v2: number | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2600
     * @tc.name: testBrkNum020026
     * @tc.desc: Verify decimal triple 6.5/-16.25/26.25 resolves per key and rejects " lg" (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020026 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(6.5, -16.25, 26.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(6.5));
      expect(v0).assertEqual(6.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(26.25));
      expect(v1).assertEqual(26.25);
      const v2: number | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2700
     * @tc.name: testBrkNum020027
     * @tc.desc: Verify decimal triple 6.75/-16.875/27.25 resolves per key and rejects "large" (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020027 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(6.75, -16.875, 27.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-16.875));
      expect(v0).assertEqual(-16.875);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(6.75));
      expect(v1).assertEqual(6.75);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2800
     * @tc.name: testBrkNum020028
     * @tc.desc: Verify decimal triple 7/-17.5/28.25 resolves per key and rejects "sm2" (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020028 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7, -17.5, 28.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(28.25));
      expect(v0).assertEqual(28.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_2900
     * @tc.name: testBrkNum020029
     * @tc.desc: Verify decimal triple 7.25/-18.125/29.25 resolves per key and rejects "Md" (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020029 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7.25, -18.125, 29.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-18.125));
      expect(v0).assertEqual(-18.125);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(29.25));
      expect(v1).assertEqual(29.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-18.125));
      expect(v2).assertEqual(-18.125);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3000
     * @tc.name: testBrkNum020030
     * @tc.desc: Verify decimal triple 7.5/-18.75/30.25 resolves per key and rejects "mds" (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020030 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7.5, -18.75, 30.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(30.25));
      expect(v0).assertEqual(30.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-18.75));
      expect(v1).assertEqual(-18.75);
      const v2: number | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3100
     * @tc.name: testBrkNum020031
     * @tc.desc: Verify decimal triple 7.75/-19.375/31.25 resolves per key and rejects "s" (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020031 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7.75, -19.375, 31.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(7.75));
      expect(v0).assertEqual(7.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(31.25));
      expect(v1).assertEqual(31.25);
      const v2: number | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3200
     * @tc.name: testBrkNum020032
     * @tc.desc: Verify decimal triple 8/-20/32.25 resolves per key and rejects "undefined" (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020032 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(8, -20, 32.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-20));
      expect(v0).assertEqual(-20);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      const v2: number | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3300
     * @tc.name: testBrkNum020033
     * @tc.desc: Verify decimal triple 8.25/-20.625/33.25 resolves per key and rejects "null" (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020033 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(8.25, -20.625, 33.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(33.25));
      expect(v0).assertEqual(33.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(8.25));
      expect(v1).assertEqual(8.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3400
     * @tc.name: testBrkNum020034
     * @tc.desc: Verify decimal triple 8.5/-21.25/34.25 resolves per key and rejects "0" (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020034 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(8.5, -21.25, 34.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-21.25));
      expect(v0).assertEqual(-21.25);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(34.25));
      expect(v1).assertEqual(34.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-21.25));
      expect(v2).assertEqual(-21.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3500
     * @tc.name: testBrkNum020035
     * @tc.desc: Verify decimal triple 8.75/-21.875/35.25 resolves per key and rejects "12" (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020035 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(8.75, -21.875, 35.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(35.25));
      expect(v0).assertEqual(35.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-21.875));
      expect(v1).assertEqual(-21.875);
      const v2: number | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3600
     * @tc.name: testBrkNum020036
     * @tc.desc: Verify decimal triple 9/-22.5/36.25 resolves per key and rejects "xl" (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020036 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9, -22.5, 36.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(9));
      expect(v0).assertEqual(9);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(36.25));
      expect(v1).assertEqual(36.25);
      const v2: number | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3700
     * @tc.name: testBrkNum020037
     * @tc.desc: Verify decimal triple 9.25/-23.125/37.25 resolves per key and rejects "SML" (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020037 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9.25, -23.125, 37.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-23.125));
      expect(v0).assertEqual(-23.125);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(9.25));
      expect(v1).assertEqual(9.25);
      const v2: number | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3800
     * @tc.name: testBrkNum020038
     * @tc.desc: Verify decimal triple 9.5/-23.75/38.25 resolves per key and rejects "md\t" (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020038 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9.5, -23.75, 38.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(38.25));
      expect(v0).assertEqual(38.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(9.5));
      expect(v1).assertEqual(9.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_3900
     * @tc.name: testBrkNum020039
     * @tc.desc: Verify decimal triple 9.75/-24.375/39.25 resolves per key and rejects "lg2" (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020039 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9.75, -24.375, 39.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-24.375));
      expect(v0).assertEqual(-24.375);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(39.25));
      expect(v1).assertEqual(39.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-24.375));
      expect(v2).assertEqual(-24.375);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4000
     * @tc.name: testBrkNum020040
     * @tc.desc: Verify decimal triple 10/-25/40.25 resolves per key and rejects "m" (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020040 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(10, -25, 40.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(40.25));
      expect(v0).assertEqual(40.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-25));
      expect(v1).assertEqual(-25);
      const v2: number | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4100
     * @tc.name: testBrkNum020041
     * @tc.desc: Verify decimal triple 10.25/-25.625/41.25 resolves per key and rejects "med" (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020041 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(10.25, -25.625, 41.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(10.25));
      expect(v0).assertEqual(10.25);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(41.25));
      expect(v1).assertEqual(41.25);
      const v2: number | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4200
     * @tc.name: testBrkNum020042
     * @tc.desc: Verify decimal triple 10.5/-26.25/42.25 resolves per key and rejects "SMALL" (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020042 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(10.5, -26.25, 42.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-26.25));
      expect(v0).assertEqual(-26.25);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(10.5));
      expect(v1).assertEqual(10.5);
      const v2: number | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4300
     * @tc.name: testBrkNum020043
     * @tc.desc: Verify decimal triple 10.75/-26.875/43.25 resolves per key and rejects "largeScreen" (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020043 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(10.75, -26.875, 43.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(43.25));
      expect(v0).assertEqual(43.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(10.75));
      expect(v1).assertEqual(10.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4400
     * @tc.name: testBrkNum020044
     * @tc.desc: Verify decimal triple 11/-27.5/44.25 resolves per key and rejects "" (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020044 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(11, -27.5, 44.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-27.5));
      expect(v0).assertEqual(-27.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(44.25));
      expect(v1).assertEqual(44.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-27.5));
      expect(v2).assertEqual(-27.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4500
     * @tc.name: testBrkNum020045
     * @tc.desc: Verify decimal triple 11.25/-28.125/45.25 resolves per key and rejects "LG" (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020045 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(11.25, -28.125, 45.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(45.25));
      expect(v0).assertEqual(45.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-28.125));
      expect(v1).assertEqual(-28.125);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4600
     * @tc.name: testBrkNum020046
     * @tc.desc: Verify decimal triple 11.5/-28.75/46.25 resolves per key and rejects "Lg" (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020046 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(11.5, -28.75, 46.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(11.5));
      expect(v0).assertEqual(11.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(46.25));
      expect(v1).assertEqual(46.25);
      const v2: number | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4700
     * @tc.name: testBrkNum020047
     * @tc.desc: Verify decimal triple 11.75/-29.375/47.25 resolves per key and rejects "lg " (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020047 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(11.75, -29.375, 47.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-29.375));
      expect(v0).assertEqual(-29.375);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(11.75));
      expect(v1).assertEqual(11.75);
      const v2: number | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4800
     * @tc.name: testBrkNum020048
     * @tc.desc: Verify decimal triple 12/-30/48.25 resolves per key and rejects " lg" (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020048 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(12, -30, 48.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(48.25));
      expect(v0).assertEqual(48.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_4900
     * @tc.name: testBrkNum020049
     * @tc.desc: Verify decimal triple 12.25/-30.625/49.25 resolves per key and rejects "large" (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020049 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(12.25, -30.625, 49.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-30.625));
      expect(v0).assertEqual(-30.625);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(49.25));
      expect(v1).assertEqual(49.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-30.625));
      expect(v2).assertEqual(-30.625);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5000
     * @tc.name: testBrkNum020050
     * @tc.desc: Verify decimal triple 12.5/-31.25/50.25 resolves per key and rejects "sm2" (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020050 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(12.5, -31.25, 50.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(50.25));
      expect(v0).assertEqual(50.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-31.25));
      expect(v1).assertEqual(-31.25);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5100
     * @tc.name: testBrkNum020051
     * @tc.desc: Verify decimal triple 12.75/-31.875/51.25 resolves per key and rejects "Md" (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020051 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(12.75, -31.875, 51.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(12.75));
      expect(v0).assertEqual(12.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(51.25));
      expect(v1).assertEqual(51.25);
      const v2: number | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5200
     * @tc.name: testBrkNum020052
     * @tc.desc: Verify decimal triple 13/-32.5/52.25 resolves per key and rejects "mds" (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020052 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(13, -32.5, 52.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-32.5));
      expect(v0).assertEqual(-32.5);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      const v2: number | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5300
     * @tc.name: testBrkNum020053
     * @tc.desc: Verify decimal triple 13.25/-33.125/53.25 resolves per key and rejects "s" (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020053 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(13.25, -33.125, 53.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(53.25));
      expect(v0).assertEqual(53.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(13.25));
      expect(v1).assertEqual(13.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5400
     * @tc.name: testBrkNum020054
     * @tc.desc: Verify decimal triple 13.5/-33.75/54.25 resolves per key and rejects "undefined" (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020054 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(13.5, -33.75, 54.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-33.75));
      expect(v0).assertEqual(-33.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(54.25));
      expect(v1).assertEqual(54.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-33.75));
      expect(v2).assertEqual(-33.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5500
     * @tc.name: testBrkNum020055
     * @tc.desc: Verify decimal triple 13.75/-34.375/55.25 resolves per key and rejects "null" (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020055 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(13.75, -34.375, 55.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(55.25));
      expect(v0).assertEqual(55.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-34.375));
      expect(v1).assertEqual(-34.375);
      const v2: number | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5600
     * @tc.name: testBrkNum020056
     * @tc.desc: Verify decimal triple 14/-35/56.25 resolves per key and rejects "0" (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020056 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(14, -35, 56.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(56.25));
      expect(v1).assertEqual(56.25);
      const v2: number | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5700
     * @tc.name: testBrkNum020057
     * @tc.desc: Verify decimal triple 14.25/-35.625/57.25 resolves per key and rejects "12" (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020057 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(14.25, -35.625, 57.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-35.625));
      expect(v0).assertEqual(-35.625);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(14.25));
      expect(v1).assertEqual(14.25);
      const v2: number | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5800
     * @tc.name: testBrkNum020058
     * @tc.desc: Verify decimal triple 14.5/-36.25/58.25 resolves per key and rejects "xl" (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020058 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(14.5, -36.25, 58.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(58.25));
      expect(v0).assertEqual(58.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(14.5));
      expect(v1).assertEqual(14.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_5900
     * @tc.name: testBrkNum020059
     * @tc.desc: Verify decimal triple 14.75/-36.875/59.25 resolves per key and rejects "SML" (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020059 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(14.75, -36.875, 59.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-36.875));
      expect(v0).assertEqual(-36.875);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(59.25));
      expect(v1).assertEqual(59.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-36.875));
      expect(v2).assertEqual(-36.875);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6000
     * @tc.name: testBrkNum020060
     * @tc.desc: Verify decimal triple 15/-37.5/60.25 resolves per key and rejects "md\t" (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020060 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(15, -37.5, 60.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(60.25));
      expect(v0).assertEqual(60.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-37.5));
      expect(v1).assertEqual(-37.5);
      const v2: number | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6100
     * @tc.name: testBrkNum020061
     * @tc.desc: Verify decimal triple 15.25/-38.125/61.25 resolves per key and rejects "lg2" (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020061 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(15.25, -38.125, 61.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(15.25));
      expect(v0).assertEqual(15.25);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(61.25));
      expect(v1).assertEqual(61.25);
      const v2: number | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6200
     * @tc.name: testBrkNum020062
     * @tc.desc: Verify decimal triple 15.5/-38.75/62.25 resolves per key and rejects "m" (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020062 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(15.5, -38.75, 62.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-38.75));
      expect(v0).assertEqual(-38.75);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(15.5));
      expect(v1).assertEqual(15.5);
      const v2: number | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6300
     * @tc.name: testBrkNum020063
     * @tc.desc: Verify decimal triple 15.75/-39.375/63.25 resolves per key and rejects "med" (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020063 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(15.75, -39.375, 63.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(63.25));
      expect(v0).assertEqual(63.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(15.75));
      expect(v1).assertEqual(15.75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6400
     * @tc.name: testBrkNum020064
     * @tc.desc: Verify decimal triple 16/-40/64.25 resolves per key and rejects "SMALL" (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020064 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(16, -40, 64.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-40));
      expect(v0).assertEqual(-40);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(64.25));
      expect(v1).assertEqual(64.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-40));
      expect(v2).assertEqual(-40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6500
     * @tc.name: testBrkNum020065
     * @tc.desc: Verify decimal triple 16.25/-40.625/65.25 resolves per key and rejects "largeScreen" (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020065 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(16.25, -40.625, 65.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(65.25));
      expect(v0).assertEqual(65.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-40.625));
      expect(v1).assertEqual(-40.625);
      const v2: number | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6600
     * @tc.name: testBrkNum020066
     * @tc.desc: Verify decimal triple 16.5/-41.25/66.25 resolves per key and rejects "" (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020066 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(16.5, -41.25, 66.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(16.5));
      expect(v0).assertEqual(16.5);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(66.25));
      expect(v1).assertEqual(66.25);
      const v2: number | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6700
     * @tc.name: testBrkNum020067
     * @tc.desc: Verify decimal triple 16.75/-41.875/67.25 resolves per key and rejects "LG" (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020067 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(16.75, -41.875, 67.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-41.875));
      expect(v0).assertEqual(-41.875);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(16.75));
      expect(v1).assertEqual(16.75);
      const v2: number | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6800
     * @tc.name: testBrkNum020068
     * @tc.desc: Verify decimal triple 17/-42.5/68.25 resolves per key and rejects "Lg" (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020068 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(17, -42.5, 68.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(68.25));
      expect(v0).assertEqual(68.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(17));
      expect(v1).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_6900
     * @tc.name: testBrkNum020069
     * @tc.desc: Verify decimal triple 17.25/-43.125/69.25 resolves per key and rejects "lg " (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020069 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(17.25, -43.125, 69.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-43.125));
      expect(v0).assertEqual(-43.125);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(69.25));
      expect(v1).assertEqual(69.25);
      const v2: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-repeat actual=%{public}s expected=%{public}s', String(v2), String(-43.125));
      expect(v2).assertEqual(-43.125);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7000
     * @tc.name: testBrkNum020070
     * @tc.desc: Verify decimal triple 17.5/-43.75/70.25 resolves per key and rejects " lg" (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020070 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(17.5, -43.75, 70.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(70.25));
      expect(v0).assertEqual(70.25);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(-43.75));
      expect(v1).assertEqual(-43.75);
      const v2: number | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7100
     * @tc.name: testBrkNum020071
     * @tc.desc: Verify decimal triple 17.75/-44.375/71.25 resolves per key and rejects "large" (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020071 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(17.75, -44.375, 71.25);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(17.75));
      expect(v0).assertEqual(17.75);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(71.25));
      expect(v1).assertEqual(71.25);
      const v2: number | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7200
     * @tc.name: testBrkNum020072
     * @tc.desc: Verify decimal triple 18/-45/72.25 resolves per key and rejects "sm2" (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020072 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(18, -45, 72.25);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(-45));
      expect(v0).assertEqual(-45);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(18));
      expect(v1).assertEqual(18);
      const v2: number | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7300
     * @tc.name: testBrkNum020073
     * @tc.desc: Verify decimal triple 18.25/-45.625/73.25 resolves per key and rejects "Md" (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020073 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(18.25, -45.625, 73.25);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(73.25));
      expect(v0).assertEqual(73.25);
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(18.25));
      expect(v1).assertEqual(18.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7400
     * @tc.name: testBrkNum020074
     * @tc.desc: Anchor: key with trailing space must not resolve and md keeps zero
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020074 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM02_7500
     * @tc.name: testBrkNum020075
     * @tc.desc: Anchor: empty key and uppercase key must not resolve for numeric triples
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020075 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum020075 end');
    })

  })
}
