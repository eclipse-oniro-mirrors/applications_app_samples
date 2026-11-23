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

// @volume rule=getValue(k)-handles-NaN-and-Infinity-boundaries-without-leaking basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix03Test() {
  describe('BreakpointMatrix03', () => {

    /**
     * @tc.number: SUB_MM_BRKNUM03_0100
     * @tc.name: testBrkNum030001
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 0 (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030001 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MAX_VALUE, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_VALUE));
      expect(v0).assertEqual(Number.MAX_VALUE);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0200
     * @tc.name: testBrkNum030002
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 1 (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030002 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.MAX_VALUE, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_VALUE));
      expect(v0).assertEqual(Number.MAX_VALUE);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0300
     * @tc.name: testBrkNum030003
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 2 (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030003 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MAX_VALUE);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_VALUE));
      expect(v0).assertEqual(Number.MAX_VALUE);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0400
     * @tc.name: testBrkNum030004
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 3 (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030004 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MAX_VALUE, Number.MAX_VALUE, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_VALUE));
      expect(v0).assertEqual(Number.MAX_VALUE);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_VALUE));
      expect(v1).assertEqual(Number.MAX_VALUE);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0500
     * @tc.name: testBrkNum030005
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 4 (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030005 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.MAX_VALUE, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_VALUE));
      expect(v1).assertEqual(Number.MAX_VALUE);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0600
     * @tc.name: testBrkNum030006
     * @tc.desc: Verify extreme numeric Number.MAX_VALUE on slot 5 (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030006 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MAX_VALUE);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_VALUE));
      expect(v1).assertEqual(Number.MAX_VALUE);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.MAX_VALUE));
      expect(v2).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0700
     * @tc.name: testBrkNum030007
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 0 (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030007 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MIN_VALUE, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_VALUE));
      expect(v0).assertEqual(Number.MIN_VALUE);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0800
     * @tc.name: testBrkNum030008
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 1 (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030008 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.MIN_VALUE, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_VALUE));
      expect(v0).assertEqual(Number.MIN_VALUE);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_0900
     * @tc.name: testBrkNum030009
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 2 (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030009 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MIN_VALUE);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_VALUE));
      expect(v0).assertEqual(Number.MIN_VALUE);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1000
     * @tc.name: testBrkNum030010
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 3 (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030010 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MIN_VALUE, Number.MIN_VALUE, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_VALUE));
      expect(v0).assertEqual(Number.MIN_VALUE);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_VALUE));
      expect(v1).assertEqual(Number.MIN_VALUE);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1100
     * @tc.name: testBrkNum030011
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 4 (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030011 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.MIN_VALUE, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_VALUE));
      expect(v1).assertEqual(Number.MIN_VALUE);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1200
     * @tc.name: testBrkNum030012
     * @tc.desc: Verify extreme numeric Number.MIN_VALUE on slot 5 (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030012 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MIN_VALUE);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_VALUE));
      expect(v1).assertEqual(Number.MIN_VALUE);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.MIN_VALUE));
      expect(v2).assertEqual(Number.MIN_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1300
     * @tc.name: testBrkNum030013
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 0 (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030013 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MAX_SAFE_INTEGER, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1400
     * @tc.name: testBrkNum030014
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 1 (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030014 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.MAX_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1500
     * @tc.name: testBrkNum030015
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 2 (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030015 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MAX_SAFE_INTEGER);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1600
     * @tc.name: testBrkNum030016
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 3 (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030016 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MAX_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1700
     * @tc.name: testBrkNum030017
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 4 (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030017 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.MAX_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MAX_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1800
     * @tc.name: testBrkNum030018
     * @tc.desc: Verify extreme numeric Number.MAX_SAFE_INTEGER on slot 5 (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030018 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MAX_SAFE_INTEGER);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MAX_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.MAX_SAFE_INTEGER));
      expect(v2).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_1900
     * @tc.name: testBrkNum030019
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 0 (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030019 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MIN_SAFE_INTEGER, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MIN_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2000
     * @tc.name: testBrkNum030020
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 1 (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030020 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.MIN_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MIN_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2100
     * @tc.name: testBrkNum030021
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 2 (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030021 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MIN_SAFE_INTEGER);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MIN_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2200
     * @tc.name: testBrkNum030022
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 3 (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030022 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.MIN_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MIN_SAFE_INTEGER);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MIN_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2300
     * @tc.name: testBrkNum030023
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 4 (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030023 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.MIN_SAFE_INTEGER, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MIN_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2400
     * @tc.name: testBrkNum030024
     * @tc.desc: Verify extreme numeric Number.MIN_SAFE_INTEGER on slot 5 (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030024 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.MIN_SAFE_INTEGER);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.MIN_SAFE_INTEGER));
      expect(v1).assertEqual(Number.MIN_SAFE_INTEGER);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.MIN_SAFE_INTEGER));
      expect(v2).assertEqual(Number.MIN_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2500
     * @tc.name: testBrkNum030025
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 0 (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030025 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.POSITIVE_INFINITY, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.POSITIVE_INFINITY));
      expect(v0).assertEqual(Number.POSITIVE_INFINITY);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2600
     * @tc.name: testBrkNum030026
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 1 (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030026 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.POSITIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.POSITIVE_INFINITY));
      expect(v0).assertEqual(Number.POSITIVE_INFINITY);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2700
     * @tc.name: testBrkNum030027
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 2 (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030027 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.POSITIVE_INFINITY);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.POSITIVE_INFINITY));
      expect(v0).assertEqual(Number.POSITIVE_INFINITY);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2800
     * @tc.name: testBrkNum030028
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 3 (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030028 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.POSITIVE_INFINITY));
      expect(v0).assertEqual(Number.POSITIVE_INFINITY);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.POSITIVE_INFINITY));
      expect(v1).assertEqual(Number.POSITIVE_INFINITY);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_2900
     * @tc.name: testBrkNum030029
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 4 (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030029 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.POSITIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.POSITIVE_INFINITY));
      expect(v1).assertEqual(Number.POSITIVE_INFINITY);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3000
     * @tc.name: testBrkNum030030
     * @tc.desc: Verify extreme numeric Number.POSITIVE_INFINITY on slot 5 (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030030 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.POSITIVE_INFINITY);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.POSITIVE_INFINITY));
      expect(v1).assertEqual(Number.POSITIVE_INFINITY);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.POSITIVE_INFINITY));
      expect(v2).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3100
     * @tc.name: testBrkNum030031
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 0 (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030031 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NEGATIVE_INFINITY, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.NEGATIVE_INFINITY));
      expect(v0).assertEqual(Number.NEGATIVE_INFINITY);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3200
     * @tc.name: testBrkNum030032
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 1 (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030032 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, Number.NEGATIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.NEGATIVE_INFINITY));
      expect(v0).assertEqual(Number.NEGATIVE_INFINITY);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3300
     * @tc.name: testBrkNum030033
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 2 (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030033 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.NEGATIVE_INFINITY);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.NEGATIVE_INFINITY));
      expect(v0).assertEqual(Number.NEGATIVE_INFINITY);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3400
     * @tc.name: testBrkNum030034
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 3 (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030034 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NEGATIVE_INFINITY, Number.NEGATIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(Number.NEGATIVE_INFINITY));
      expect(v0).assertEqual(Number.NEGATIVE_INFINITY);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.NEGATIVE_INFINITY));
      expect(v1).assertEqual(Number.NEGATIVE_INFINITY);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3500
     * @tc.name: testBrkNum030035
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 4 (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030035 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.NEGATIVE_INFINITY, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.NEGATIVE_INFINITY));
      expect(v1).assertEqual(Number.NEGATIVE_INFINITY);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3600
     * @tc.name: testBrkNum030036
     * @tc.desc: Verify extreme numeric Number.NEGATIVE_INFINITY on slot 5 (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030036 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, Number.NEGATIVE_INFINITY);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(Number.NEGATIVE_INFINITY));
      expect(v1).assertEqual(Number.NEGATIVE_INFINITY);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(Number.NEGATIVE_INFINITY));
      expect(v2).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3700
     * @tc.name: testBrkNum030037
     * @tc.desc: Verify extreme numeric -0 on slot 0 (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030037 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-0, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(-0));
      expect(v0).assertEqual(-0);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3800
     * @tc.name: testBrkNum030038
     * @tc.desc: Verify extreme numeric -0 on slot 1 (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030038 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, -0, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(-0));
      expect(v0).assertEqual(-0);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_3900
     * @tc.name: testBrkNum030039
     * @tc.desc: Verify extreme numeric -0 on slot 2 (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030039 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, -0);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(-0));
      expect(v0).assertEqual(-0);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4000
     * @tc.name: testBrkNum030040
     * @tc.desc: Verify extreme numeric -0 on slot 3 (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030040 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-0, -0, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(-0));
      expect(v0).assertEqual(-0);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(-0));
      expect(v1).assertEqual(-0);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4100
     * @tc.name: testBrkNum030041
     * @tc.desc: Verify extreme numeric -0 on slot 4 (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030041 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, -0, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(-0));
      expect(v1).assertEqual(-0);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4200
     * @tc.name: testBrkNum030042
     * @tc.desc: Verify extreme numeric -0 on slot 5 (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030042 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, -0);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(-0));
      expect(v1).assertEqual(-0);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(-0));
      expect(v2).assertEqual(-0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4300
     * @tc.name: testBrkNum030043
     * @tc.desc: Verify extreme numeric 1e21 on slot 0 (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030043 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1e21, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e21));
      expect(v0).assertEqual(1e21);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4400
     * @tc.name: testBrkNum030044
     * @tc.desc: Verify extreme numeric 1e21 on slot 1 (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030044 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 1e21, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e21));
      expect(v0).assertEqual(1e21);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4500
     * @tc.name: testBrkNum030045
     * @tc.desc: Verify extreme numeric 1e21 on slot 2 (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030045 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 1e21);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e21));
      expect(v0).assertEqual(1e21);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4600
     * @tc.name: testBrkNum030046
     * @tc.desc: Verify extreme numeric 1e21 on slot 3 (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030046 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1e21, 1e21, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e21));
      expect(v0).assertEqual(1e21);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e21));
      expect(v1).assertEqual(1e21);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4700
     * @tc.name: testBrkNum030047
     * @tc.desc: Verify extreme numeric 1e21 on slot 4 (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030047 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, 1e21, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e21));
      expect(v1).assertEqual(1e21);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4800
     * @tc.name: testBrkNum030048
     * @tc.desc: Verify extreme numeric 1e21 on slot 5 (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030048 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 1e21);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e21));
      expect(v1).assertEqual(1e21);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(1e21));
      expect(v2).assertEqual(1e21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_4900
     * @tc.name: testBrkNum030049
     * @tc.desc: Verify extreme numeric -1e21 on slot 0 (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030049 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-1e21, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(-1e21));
      expect(v0).assertEqual(-1e21);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5000
     * @tc.name: testBrkNum030050
     * @tc.desc: Verify extreme numeric -1e21 on slot 1 (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030050 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, -1e21, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(-1e21));
      expect(v0).assertEqual(-1e21);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5100
     * @tc.name: testBrkNum030051
     * @tc.desc: Verify extreme numeric -1e21 on slot 2 (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030051 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, -1e21);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(-1e21));
      expect(v0).assertEqual(-1e21);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5200
     * @tc.name: testBrkNum030052
     * @tc.desc: Verify extreme numeric -1e21 on slot 3 (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030052 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-1e21, -1e21, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(-1e21));
      expect(v0).assertEqual(-1e21);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(-1e21));
      expect(v1).assertEqual(-1e21);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5300
     * @tc.name: testBrkNum030053
     * @tc.desc: Verify extreme numeric -1e21 on slot 4 (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030053 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, -1e21, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(-1e21));
      expect(v1).assertEqual(-1e21);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5400
     * @tc.name: testBrkNum030054
     * @tc.desc: Verify extreme numeric -1e21 on slot 5 (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030054 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, -1e21);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(-1e21));
      expect(v1).assertEqual(-1e21);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(-1e21));
      expect(v2).assertEqual(-1e21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5500
     * @tc.name: testBrkNum030055
     * @tc.desc: Verify extreme numeric 1e-7 on slot 0 (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030055 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1e-7, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e-7));
      expect(v0).assertEqual(1e-7);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5600
     * @tc.name: testBrkNum030056
     * @tc.desc: Verify extreme numeric 1e-7 on slot 1 (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030056 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 1e-7, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e-7));
      expect(v0).assertEqual(1e-7);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5700
     * @tc.name: testBrkNum030057
     * @tc.desc: Verify extreme numeric 1e-7 on slot 2 (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030057 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 1e-7);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e-7));
      expect(v0).assertEqual(1e-7);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5800
     * @tc.name: testBrkNum030058
     * @tc.desc: Verify extreme numeric 1e-7 on slot 3 (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030058 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1e-7, 1e-7, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(1e-7));
      expect(v0).assertEqual(1e-7);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e-7));
      expect(v1).assertEqual(1e-7);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_5900
     * @tc.name: testBrkNum030059
     * @tc.desc: Verify extreme numeric 1e-7 on slot 4 (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030059 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, 1e-7, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e-7));
      expect(v1).assertEqual(1e-7);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6000
     * @tc.name: testBrkNum030060
     * @tc.desc: Verify extreme numeric 1e-7 on slot 5 (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030060 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 1e-7);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(1e-7));
      expect(v1).assertEqual(1e-7);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(1e-7));
      expect(v2).assertEqual(1e-7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6100
     * @tc.name: testBrkNum030061
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 0 (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030061 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.1 + 0.2, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(0.1 + 0.2));
      expect(v0).assertEqual(0.1 + 0.2);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6200
     * @tc.name: testBrkNum030062
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 1 (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030062 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 0.1 + 0.2, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(0.1 + 0.2));
      expect(v0).assertEqual(0.1 + 0.2);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6300
     * @tc.name: testBrkNum030063
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 2 (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030063 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 0.1 + 0.2);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(0.1 + 0.2));
      expect(v0).assertEqual(0.1 + 0.2);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6400
     * @tc.name: testBrkNum030064
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 3 (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030064 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.1 + 0.2, 0.1 + 0.2, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(0.1 + 0.2));
      expect(v0).assertEqual(0.1 + 0.2);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(0.1 + 0.2));
      expect(v1).assertEqual(0.1 + 0.2);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6500
     * @tc.name: testBrkNum030065
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 4 (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030065 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, 0.1 + 0.2, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(0.1 + 0.2));
      expect(v1).assertEqual(0.1 + 0.2);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6600
     * @tc.name: testBrkNum030066
     * @tc.desc: Verify extreme numeric 0.1 + 0.2 on slot 5 (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030066 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 0.1 + 0.2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(0.1 + 0.2));
      expect(v1).assertEqual(0.1 + 0.2);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(0.1 + 0.2));
      expect(v2).assertEqual(0.1 + 0.2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6700
     * @tc.name: testBrkNum030067
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 0 (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030067 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9007199254740993, 1, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(9007199254740993));
      expect(v0).assertEqual(9007199254740993);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = sut.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6800
     * @tc.name: testBrkNum030068
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 1 (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030068 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 9007199254740993, 2);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v0), String(9007199254740993));
      expect(v0).assertEqual(9007199254740993);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_6900
     * @tc.name: testBrkNum030069
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 2 (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030069 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 9007199254740993);
      const v0: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v0), String(9007199254740993));
      expect(v0).assertEqual(9007199254740993);
      const v1: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'extreme-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7000
     * @tc.name: testBrkNum030070
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 3 (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030070 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(9007199254740993, 9007199254740993, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-extreme actual=%{public}s expected=%{public}s', String(v0), String(9007199254740993));
      expect(v0).assertEqual(9007199254740993);
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(9007199254740993));
      expect(v1).assertEqual(9007199254740993);
      const v2: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7100
     * @tc.name: testBrkNum030071
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 4 (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030071 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, 9007199254740993, 2);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-extreme actual=%{public}s expected=%{public}s', String(v1), String(9007199254740993));
      expect(v1).assertEqual(9007199254740993);
      const v2: number | undefined = sut.getValue('nan');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "nan", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7200
     * @tc.name: testBrkNum030072
     * @tc.desc: Verify extreme numeric 9007199254740993 on slot 5 (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkNum030072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030072 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 9007199254740993);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-normal actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme actual=%{public}s expected=%{public}s', String(v1), String(9007199254740993));
      expect(v1).assertEqual(9007199254740993);
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-extreme-repeat actual=%{public}s expected=%{public}s', String(v2), String(9007199254740993));
      expect(v2).assertEqual(9007199254740993);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7300
     * @tc.name: testBrkNum030073
     * @tc.desc: Anchor: NaN field must not leak into other breakpoint slots
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum030073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030073 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.NaN, 7);
      const v0: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-survives actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: number | undefined = sut.getValue('NaN');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "NaN", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7400
     * @tc.name: testBrkNum030074
     * @tc.desc: Anchor: negative zero must keep its sign in the sm slot
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum030074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030074 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-0, 1, 2);
      const v0: number | undefined = 1 / (sut.getValue('sm') as number);
      hilog.info(DOMAIN, TAG, 'negative-zero-sign actual=%{public}s expected=%{public}s', String(v0), String(Number.NEGATIVE_INFINITY));
      expect(v0).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(DOMAIN, TAG, 'negative-zero-equals-zero actual=%{public}s expected=true', String(sut.getValue('sm') === 0));
      expect(sut.getValue('sm') === 0).assertTrue();
      const v1: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-normal actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKNUM03_7500
     * @tc.name: testBrkNum030075
     * @tc.desc: Anchor: all three slots NaN must stay NaN per key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkNum030075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030075 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, Number.NaN, Number.NaN);
      const v0: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v0));
      expect(v0).assertNaN();
      const v1: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v1));
      expect(v1).assertNaN();
      const v2: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'nan-check actual=%{public}s', String(v2));
      expect(v2).assertNaN();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkNum030075 end');
    })

  })
}
