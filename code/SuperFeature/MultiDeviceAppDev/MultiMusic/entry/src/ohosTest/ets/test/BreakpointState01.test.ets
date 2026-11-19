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

// @volume rule=getValue-order-independent,values-11/22/33 basis=state-derivation cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointState01Test() {
  describe('BreakpointState01', () => {

    /**
     * @tc.number: SUB_MM_BRKORD01_0100
     * @tc.name: testBrkOrd010001
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010001 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v1", "md-v1", "lg-v1");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v1"));
      expect(v0).assertEqual("md-v1");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v1"));
      expect(v1).assertEqual("sm-v1");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0200
     * @tc.name: testBrkOrd010002
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010002 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v2", "md-v2", "lg-v2");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v2"));
      expect(v0).assertEqual("sm-v2");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v2"));
      expect(v1).assertEqual("lg-v2");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0300
     * @tc.name: testBrkOrd010003
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010003 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v3", "md-v3", "lg-v3");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v3"));
      expect(v0).assertEqual("lg-v3");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v3"));
      expect(v1).assertEqual("sm-v3");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0400
     * @tc.name: testBrkOrd010004
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010004 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v4", "md-v4", "lg-v4");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v4"));
      expect(v0).assertEqual("md-v4");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v4"));
      expect(v1).assertEqual("lg-v4");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0500
     * @tc.name: testBrkOrd010005
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010005 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v5", "md-v5", "lg-v5");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v5"));
      expect(v0).assertEqual("sm-v5");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v5"));
      expect(v1).assertEqual("md-v5");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0600
     * @tc.name: testBrkOrd010006
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010006 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v6", "md-v6", "lg-v6");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v6"));
      expect(v0).assertEqual("lg-v6");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v6"));
      expect(v1).assertEqual("md-v6");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0700
     * @tc.name: testBrkOrd010007
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010007 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v7", "md-v7", "lg-v7");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v7"));
      expect(v0).assertEqual("md-v7");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v7"));
      expect(v1).assertEqual("sm-v7");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0800
     * @tc.name: testBrkOrd010008
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010008 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v8", "md-v8", "lg-v8");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v8"));
      expect(v0).assertEqual("sm-v8");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v8"));
      expect(v1).assertEqual("lg-v8");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_0900
     * @tc.name: testBrkOrd010009
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010009 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v9", "md-v9", "lg-v9");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v9"));
      expect(v0).assertEqual("lg-v9");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v9"));
      expect(v1).assertEqual("sm-v9");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1000
     * @tc.name: testBrkOrd010010
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010010 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v10", "md-v10", "lg-v10");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v10"));
      expect(v0).assertEqual("md-v10");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v10"));
      expect(v1).assertEqual("lg-v10");
      const v2: string | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1100
     * @tc.name: testBrkOrd010011
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010011 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v11", "md-v11", "lg-v11");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v11"));
      expect(v0).assertEqual("sm-v11");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v11"));
      expect(v1).assertEqual("md-v11");
      const v2: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1200
     * @tc.name: testBrkOrd010012
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010012 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v12", "md-v12", "lg-v12");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v12"));
      expect(v0).assertEqual("lg-v12");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v12"));
      expect(v1).assertEqual("md-v12");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1300
     * @tc.name: testBrkOrd010013
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010013 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v13", "md-v13", "lg-v13");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v13"));
      expect(v0).assertEqual("md-v13");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v13"));
      expect(v1).assertEqual("sm-v13");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1400
     * @tc.name: testBrkOrd010014
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010014 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v14", "md-v14", "lg-v14");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v14"));
      expect(v0).assertEqual("sm-v14");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v14"));
      expect(v1).assertEqual("lg-v14");
      const v2: string | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1500
     * @tc.name: testBrkOrd010015
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010015 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v15", "md-v15", "lg-v15");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v15"));
      expect(v0).assertEqual("lg-v15");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v15"));
      expect(v1).assertEqual("sm-v15");
      const v2: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1600
     * @tc.name: testBrkOrd010016
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010016 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v16", "md-v16", "lg-v16");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v16"));
      expect(v0).assertEqual("md-v16");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v16"));
      expect(v1).assertEqual("lg-v16");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1700
     * @tc.name: testBrkOrd010017
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010017 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v17", "md-v17", "lg-v17");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v17"));
      expect(v0).assertEqual("sm-v17");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v17"));
      expect(v1).assertEqual("md-v17");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1800
     * @tc.name: testBrkOrd010018
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010018 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v18", "md-v18", "lg-v18");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v18"));
      expect(v0).assertEqual("lg-v18");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v18"));
      expect(v1).assertEqual("md-v18");
      const v2: string | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_1900
     * @tc.name: testBrkOrd010019
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010019 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v19", "md-v19", "lg-v19");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v19"));
      expect(v0).assertEqual("md-v19");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v19"));
      expect(v1).assertEqual("sm-v19");
      const v2: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2000
     * @tc.name: testBrkOrd010020
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010020 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v20", "md-v20", "lg-v20");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v20"));
      expect(v0).assertEqual("sm-v20");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v20"));
      expect(v1).assertEqual("lg-v20");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2100
     * @tc.name: testBrkOrd010021
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010021 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v21", "md-v21", "lg-v21");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v21"));
      expect(v0).assertEqual("lg-v21");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v21"));
      expect(v1).assertEqual("sm-v21");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2200
     * @tc.name: testBrkOrd010022
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010022 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v22", "md-v22", "lg-v22");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v22"));
      expect(v0).assertEqual("md-v22");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v22"));
      expect(v1).assertEqual("lg-v22");
      const v2: string | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2300
     * @tc.name: testBrkOrd010023
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010023 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v23", "md-v23", "lg-v23");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v23"));
      expect(v0).assertEqual("sm-v23");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v23"));
      expect(v1).assertEqual("md-v23");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2400
     * @tc.name: testBrkOrd010024
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010024 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v24", "md-v24", "lg-v24");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v24"));
      expect(v0).assertEqual("lg-v24");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v24"));
      expect(v1).assertEqual("md-v24");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2500
     * @tc.name: testBrkOrd010025
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010025 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v25", "md-v25", "lg-v25");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v25"));
      expect(v0).assertEqual("md-v25");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v25"));
      expect(v1).assertEqual("sm-v25");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2600
     * @tc.name: testBrkOrd010026
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010026 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v26", "md-v26", "lg-v26");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v26"));
      expect(v0).assertEqual("sm-v26");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v26"));
      expect(v1).assertEqual("lg-v26");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2700
     * @tc.name: testBrkOrd010027
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010027 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v27", "md-v27", "lg-v27");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v27"));
      expect(v0).assertEqual("lg-v27");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v27"));
      expect(v1).assertEqual("sm-v27");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2800
     * @tc.name: testBrkOrd010028
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010028 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v28", "md-v28", "lg-v28");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v28"));
      expect(v0).assertEqual("md-v28");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v28"));
      expect(v1).assertEqual("lg-v28");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_2900
     * @tc.name: testBrkOrd010029
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010029 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v29", "md-v29", "lg-v29");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v29"));
      expect(v0).assertEqual("sm-v29");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v29"));
      expect(v1).assertEqual("md-v29");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3000
     * @tc.name: testBrkOrd010030
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010030 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v30", "md-v30", "lg-v30");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v30"));
      expect(v0).assertEqual("lg-v30");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v30"));
      expect(v1).assertEqual("md-v30");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3100
     * @tc.name: testBrkOrd010031
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010031 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v31", "md-v31", "lg-v31");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v31"));
      expect(v0).assertEqual("md-v31");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v31"));
      expect(v1).assertEqual("sm-v31");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3200
     * @tc.name: testBrkOrd010032
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010032 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v32", "md-v32", "lg-v32");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v32"));
      expect(v0).assertEqual("sm-v32");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v32"));
      expect(v1).assertEqual("lg-v32");
      const v2: string | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3300
     * @tc.name: testBrkOrd010033
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010033 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v33", "md-v33", "lg-v33");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v33"));
      expect(v0).assertEqual("lg-v33");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v33"));
      expect(v1).assertEqual("sm-v33");
      const v2: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3400
     * @tc.name: testBrkOrd010034
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010034 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v34", "md-v34", "lg-v34");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v34"));
      expect(v0).assertEqual("md-v34");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v34"));
      expect(v1).assertEqual("lg-v34");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3500
     * @tc.name: testBrkOrd010035
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010035 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v35", "md-v35", "lg-v35");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v35"));
      expect(v0).assertEqual("sm-v35");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v35"));
      expect(v1).assertEqual("md-v35");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3600
     * @tc.name: testBrkOrd010036
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010036 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v36", "md-v36", "lg-v36");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v36"));
      expect(v0).assertEqual("lg-v36");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v36"));
      expect(v1).assertEqual("md-v36");
      const v2: string | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3700
     * @tc.name: testBrkOrd010037
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010037 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v37", "md-v37", "lg-v37");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v37"));
      expect(v0).assertEqual("md-v37");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v37"));
      expect(v1).assertEqual("sm-v37");
      const v2: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3800
     * @tc.name: testBrkOrd010038
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010038 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v38", "md-v38", "lg-v38");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v38"));
      expect(v0).assertEqual("sm-v38");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v38"));
      expect(v1).assertEqual("lg-v38");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_3900
     * @tc.name: testBrkOrd010039
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010039 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v39", "md-v39", "lg-v39");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v39"));
      expect(v0).assertEqual("lg-v39");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v39"));
      expect(v1).assertEqual("sm-v39");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4000
     * @tc.name: testBrkOrd010040
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010040 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v40", "md-v40", "lg-v40");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v40"));
      expect(v0).assertEqual("md-v40");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v40"));
      expect(v1).assertEqual("lg-v40");
      const v2: string | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4100
     * @tc.name: testBrkOrd010041
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010041 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v41", "md-v41", "lg-v41");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v41"));
      expect(v0).assertEqual("sm-v41");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v41"));
      expect(v1).assertEqual("md-v41");
      const v2: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4200
     * @tc.name: testBrkOrd010042
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010042 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v42", "md-v42", "lg-v42");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v42"));
      expect(v0).assertEqual("lg-v42");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v42"));
      expect(v1).assertEqual("md-v42");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4300
     * @tc.name: testBrkOrd010043
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010043 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v43", "md-v43", "lg-v43");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v43"));
      expect(v0).assertEqual("md-v43");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v43"));
      expect(v1).assertEqual("sm-v43");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4400
     * @tc.name: testBrkOrd010044
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010044 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v44", "md-v44", "lg-v44");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v44"));
      expect(v0).assertEqual("sm-v44");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v44"));
      expect(v1).assertEqual("lg-v44");
      const v2: string | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4500
     * @tc.name: testBrkOrd010045
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010045 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v45", "md-v45", "lg-v45");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v45"));
      expect(v0).assertEqual("lg-v45");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v45"));
      expect(v1).assertEqual("sm-v45");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4600
     * @tc.name: testBrkOrd010046
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010046 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v46", "md-v46", "lg-v46");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v46"));
      expect(v0).assertEqual("md-v46");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v46"));
      expect(v1).assertEqual("lg-v46");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4700
     * @tc.name: testBrkOrd010047
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010047 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v47", "md-v47", "lg-v47");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v47"));
      expect(v0).assertEqual("sm-v47");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v47"));
      expect(v1).assertEqual("md-v47");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4800
     * @tc.name: testBrkOrd010048
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010048 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v48", "md-v48", "lg-v48");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v48"));
      expect(v0).assertEqual("lg-v48");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v48"));
      expect(v1).assertEqual("md-v48");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_4900
     * @tc.name: testBrkOrd010049
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010049 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v49", "md-v49", "lg-v49");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v49"));
      expect(v0).assertEqual("md-v49");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v49"));
      expect(v1).assertEqual("sm-v49");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5000
     * @tc.name: testBrkOrd010050
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010050 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v50", "md-v50", "lg-v50");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v50"));
      expect(v0).assertEqual("sm-v50");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v50"));
      expect(v1).assertEqual("lg-v50");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5100
     * @tc.name: testBrkOrd010051
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010051 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v51", "md-v51", "lg-v51");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v51"));
      expect(v0).assertEqual("lg-v51");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v51"));
      expect(v1).assertEqual("sm-v51");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5200
     * @tc.name: testBrkOrd010052
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010052 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v52", "md-v52", "lg-v52");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v52"));
      expect(v0).assertEqual("md-v52");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v52"));
      expect(v1).assertEqual("lg-v52");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5300
     * @tc.name: testBrkOrd010053
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010053 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v53", "md-v53", "lg-v53");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v53"));
      expect(v0).assertEqual("sm-v53");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v53"));
      expect(v1).assertEqual("md-v53");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5400
     * @tc.name: testBrkOrd010054
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010054 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v54", "md-v54", "lg-v54");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v54"));
      expect(v0).assertEqual("lg-v54");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v54"));
      expect(v1).assertEqual("md-v54");
      const v2: string | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5500
     * @tc.name: testBrkOrd010055
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010055 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v55", "md-v55", "lg-v55");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v55"));
      expect(v0).assertEqual("md-v55");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v55"));
      expect(v1).assertEqual("sm-v55");
      const v2: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5600
     * @tc.name: testBrkOrd010056
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010056 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v56", "md-v56", "lg-v56");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v56"));
      expect(v0).assertEqual("sm-v56");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v56"));
      expect(v1).assertEqual("lg-v56");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5700
     * @tc.name: testBrkOrd010057
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010057 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v57", "md-v57", "lg-v57");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v57"));
      expect(v0).assertEqual("lg-v57");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v57"));
      expect(v1).assertEqual("sm-v57");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5800
     * @tc.name: testBrkOrd010058
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010058 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v58", "md-v58", "lg-v58");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v58"));
      expect(v0).assertEqual("md-v58");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v58"));
      expect(v1).assertEqual("lg-v58");
      const v2: string | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_5900
     * @tc.name: testBrkOrd010059
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010059 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v59", "md-v59", "lg-v59");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v59"));
      expect(v0).assertEqual("sm-v59");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v59"));
      expect(v1).assertEqual("md-v59");
      const v2: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6000
     * @tc.name: testBrkOrd010060
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010060 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v60", "md-v60", "lg-v60");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v60"));
      expect(v0).assertEqual("lg-v60");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v60"));
      expect(v1).assertEqual("md-v60");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6100
     * @tc.name: testBrkOrd010061
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010061 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v61", "md-v61", "lg-v61");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v61"));
      expect(v0).assertEqual("md-v61");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v61"));
      expect(v1).assertEqual("sm-v61");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6200
     * @tc.name: testBrkOrd010062
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010062 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v62", "md-v62", "lg-v62");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v62"));
      expect(v0).assertEqual("sm-v62");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v62"));
      expect(v1).assertEqual("lg-v62");
      const v2: string | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6300
     * @tc.name: testBrkOrd010063
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010063 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v63", "md-v63", "lg-v63");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v63"));
      expect(v0).assertEqual("lg-v63");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v63"));
      expect(v1).assertEqual("sm-v63");
      const v2: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6400
     * @tc.name: testBrkOrd010064
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010064 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v64", "md-v64", "lg-v64");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v64"));
      expect(v0).assertEqual("md-v64");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v64"));
      expect(v1).assertEqual("lg-v64");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6500
     * @tc.name: testBrkOrd010065
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010065 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v65", "md-v65", "lg-v65");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v65"));
      expect(v0).assertEqual("sm-v65");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v65"));
      expect(v1).assertEqual("md-v65");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6600
     * @tc.name: testBrkOrd010066
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010066 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v66", "md-v66", "lg-v66");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v66"));
      expect(v0).assertEqual("lg-v66");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v66"));
      expect(v1).assertEqual("md-v66");
      const v2: string | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6700
     * @tc.name: testBrkOrd010067
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010067 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v67", "md-v67", "lg-v67");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v67"));
      expect(v0).assertEqual("md-v67");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v67"));
      expect(v1).assertEqual("sm-v67");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6800
     * @tc.name: testBrkOrd010068
     * @tc.desc: Verify key order sm>lg>md does not change the returned value (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010068 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v68", "md-v68", "lg-v68");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v68"));
      expect(v0).assertEqual("sm-v68");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v68"));
      expect(v1).assertEqual("lg-v68");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_6900
     * @tc.name: testBrkOrd010069
     * @tc.desc: Verify key order lg>sm>md does not change the returned value (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010069 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v69", "md-v69", "lg-v69");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v69"));
      expect(v0).assertEqual("lg-v69");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v69"));
      expect(v1).assertEqual("sm-v69");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7000
     * @tc.name: testBrkOrd010070
     * @tc.desc: Verify key order md>lg>sm does not change the returned value (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010070 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v70", "md-v70", "lg-v70");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v70"));
      expect(v0).assertEqual("md-v70");
      const v1: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg-v70"));
      expect(v1).assertEqual("lg-v70");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7100
     * @tc.name: testBrkOrd010071
     * @tc.desc: Verify key order sm>md>lg does not change the returned value (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010071 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v71", "md-v71", "lg-v71");
      const v0: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm-v71"));
      expect(v0).assertEqual("sm-v71");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v71"));
      expect(v1).assertEqual("md-v71");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7200
     * @tc.name: testBrkOrd010072
     * @tc.desc: Verify key order lg>md>sm does not change the returned value (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010072 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v72", "md-v72", "lg-v72");
      const v0: string | undefined = sut.getValue("lg");
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("lg-v72"));
      expect(v0).assertEqual("lg-v72");
      const v1: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md-v72"));
      expect(v1).assertEqual("md-v72");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7300
     * @tc.name: testBrkOrd010073
     * @tc.desc: Verify key order md>sm>lg does not change the returned value (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkOrd010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010073 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm-v73", "md-v73", "lg-v73");
      const v0: string | undefined = sut.getValue("md");
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("md-v73"));
      expect(v0).assertEqual("md-v73");
      const v1: string | undefined = sut.getValue("sm");
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("sm-v73"));
      expect(v1).assertEqual("sm-v73");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7400
     * @tc.name: testBrkOrd010074
     * @tc.desc: Anchor: invalid keys interleaved between valid reads must not affect results
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkOrd010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010074 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      const v0: string | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v0));
      expect(v0).assertUndefined();
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-after-miss actual=%{public}s expected=%{public}s', String(v1), String('l'));
      expect(v1).assertEqual('l');
      const v2: string | undefined = sut.getValue('sm ');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKORD01_7500
     * @tc.name: testBrkOrd010075
     * @tc.desc: Anchor: repeated reads of the same key stay stable
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkOrd010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010075 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'first-read actual=%{public}s expected=%{public}s', String(v0), String('m'));
      expect(v0).assertEqual('m');
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'second-read actual=%{public}s expected=%{public}s', String(v1), String('m'));
      expect(v1).assertEqual('m');
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'third-read actual=%{public}s expected=%{public}s', String(v2), String('m'));
      expect(v2).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkOrd010075 end');
    })

  })
}
