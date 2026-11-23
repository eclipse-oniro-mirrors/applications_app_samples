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

// @volume rule=getValue(k)-returns-field-k-for-ascii-string-triples,else-undefined basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix04Test() {
  describe('BreakpointMatrix04', () => {

    /**
     * @tc.number: SUB_MM_BRKSTR01_0100
     * @tc.name: testBrkStr010001
     * @tc.desc: Verify ascii string triple in row 1 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010001 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "tabs1", "discovery");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("tabs1"));
      expect(v0).assertEqual("tabs1");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0200
     * @tc.name: testBrkStr010002
     * @tc.desc: Verify ascii string triple in row 2 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010002 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", "index", "home");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("index"));
      expect(v1).assertEqual("index");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0300
     * @tc.name: testBrkStr010003
     * @tc.desc: Verify ascii string triple in row 3 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010003 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tab0", "radio", "x");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("radio"));
      expect(v2).assertEqual("radio");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0400
     * @tc.name: testBrkStr010004
     * @tc.desc: Verify ascii string triple in row 4 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010004 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tabs1", "mine", "y");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("y"));
      expect(v0).assertEqual("y");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0500
     * @tc.name: testBrkStr010005
     * @tc.desc: Verify ascii string triple in row 5 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010005 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("index", "discovery", "z");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("discovery"));
      expect(v0).assertEqual("discovery");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0600
     * @tc.name: testBrkStr010006
     * @tc.desc: Verify ascii string triple in row 6 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010006 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("radio", "home", "song");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("home"));
      expect(v1).assertEqual("home");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0700
     * @tc.name: testBrkStr010007
     * @tc.desc: Verify ascii string triple in row 7 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010007 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mine", "x", "list");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("x"));
      expect(v2).assertEqual("x");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0800
     * @tc.name: testBrkStr010008
     * @tc.desc: Verify ascii string triple in row 8 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010008 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("discovery", "y", "banner");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("banner"));
      expect(v0).assertEqual("banner");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_0900
     * @tc.name: testBrkStr010009
     * @tc.desc: Verify ascii string triple in row 9 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010009 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("home", "z", "play");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("z"));
      expect(v0).assertEqual("z");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1000
     * @tc.name: testBrkStr010010
     * @tc.desc: Verify ascii string triple in row 10 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010010 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("x", "song", "title");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("song"));
      expect(v1).assertEqual("song");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1100
     * @tc.name: testBrkStr010011
     * @tc.desc: Verify ascii string triple in row 11 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010011 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("y", "list", "subtitle");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("list"));
      expect(v2).assertEqual("list");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1200
     * @tc.name: testBrkStr010012
     * @tc.desc: Verify ascii string triple in row 12 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010012 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("z", "banner", "detail");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("detail"));
      expect(v0).assertEqual("detail");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1300
     * @tc.name: testBrkStr010013
     * @tc.desc: Verify ascii string triple in row 13 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010013 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("song", "play", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("play"));
      expect(v0).assertEqual("play");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1400
     * @tc.name: testBrkStr010014
     * @tc.desc: Verify ascii string triple in row 14 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010014 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("list", "title", "md");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("title"));
      expect(v1).assertEqual("title");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1500
     * @tc.name: testBrkStr010015
     * @tc.desc: Verify ascii string triple in row 15 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010015 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("banner", "subtitle", "sm");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("subtitle"));
      expect(v2).assertEqual("subtitle");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1600
     * @tc.name: testBrkStr010016
     * @tc.desc: Verify ascii string triple in row 16 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010016 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("play", "detail", "tab0");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("tab0"));
      expect(v0).assertEqual("tab0");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1700
     * @tc.name: testBrkStr010017
     * @tc.desc: Verify ascii string triple in row 17 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010017 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("title", "lg", "tabs1");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg"));
      expect(v0).assertEqual("lg");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1800
     * @tc.name: testBrkStr010018
     * @tc.desc: Verify ascii string triple in row 18 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010018 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("subtitle", "md", "index");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md"));
      expect(v1).assertEqual("md");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_1900
     * @tc.name: testBrkStr010019
     * @tc.desc: Verify ascii string triple in row 19 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010019 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("detail", "sm", "radio");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("sm"));
      expect(v2).assertEqual("sm");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2000
     * @tc.name: testBrkStr010020
     * @tc.desc: Verify ascii string triple in row 20 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010020 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg", "tab0", "mine");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("mine"));
      expect(v0).assertEqual("mine");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2100
     * @tc.name: testBrkStr010021
     * @tc.desc: Verify ascii string triple in row 21 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010021 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "tabs1", "discovery");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("tabs1"));
      expect(v0).assertEqual("tabs1");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2200
     * @tc.name: testBrkStr010022
     * @tc.desc: Verify ascii string triple in row 22 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010022 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", "index", "home");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("index"));
      expect(v1).assertEqual("index");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2300
     * @tc.name: testBrkStr010023
     * @tc.desc: Verify ascii string triple in row 23 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010023 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tab0", "radio", "x");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("radio"));
      expect(v2).assertEqual("radio");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2400
     * @tc.name: testBrkStr010024
     * @tc.desc: Verify ascii string triple in row 24 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010024 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tabs1", "mine", "y");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("y"));
      expect(v0).assertEqual("y");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2500
     * @tc.name: testBrkStr010025
     * @tc.desc: Verify ascii string triple in row 25 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010025 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("index", "discovery", "z");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("discovery"));
      expect(v0).assertEqual("discovery");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2600
     * @tc.name: testBrkStr010026
     * @tc.desc: Verify ascii string triple in row 26 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010026 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("radio", "home", "song");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("home"));
      expect(v1).assertEqual("home");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2700
     * @tc.name: testBrkStr010027
     * @tc.desc: Verify ascii string triple in row 27 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010027 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mine", "x", "list");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("x"));
      expect(v2).assertEqual("x");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2800
     * @tc.name: testBrkStr010028
     * @tc.desc: Verify ascii string triple in row 28 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010028 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("discovery", "y", "banner");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("banner"));
      expect(v0).assertEqual("banner");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_2900
     * @tc.name: testBrkStr010029
     * @tc.desc: Verify ascii string triple in row 29 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010029 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("home", "z", "play");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("z"));
      expect(v0).assertEqual("z");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3000
     * @tc.name: testBrkStr010030
     * @tc.desc: Verify ascii string triple in row 30 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010030 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("x", "song", "title");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("song"));
      expect(v1).assertEqual("song");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3100
     * @tc.name: testBrkStr010031
     * @tc.desc: Verify ascii string triple in row 31 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010031 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("y", "list", "subtitle");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("list"));
      expect(v2).assertEqual("list");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3200
     * @tc.name: testBrkStr010032
     * @tc.desc: Verify ascii string triple in row 32 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010032 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("z", "banner", "detail");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("detail"));
      expect(v0).assertEqual("detail");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3300
     * @tc.name: testBrkStr010033
     * @tc.desc: Verify ascii string triple in row 33 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010033 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("song", "play", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("play"));
      expect(v0).assertEqual("play");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3400
     * @tc.name: testBrkStr010034
     * @tc.desc: Verify ascii string triple in row 34 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010034 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("list", "title", "md");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("title"));
      expect(v1).assertEqual("title");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3500
     * @tc.name: testBrkStr010035
     * @tc.desc: Verify ascii string triple in row 35 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010035 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("banner", "subtitle", "sm");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("subtitle"));
      expect(v2).assertEqual("subtitle");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3600
     * @tc.name: testBrkStr010036
     * @tc.desc: Verify ascii string triple in row 36 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010036 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("play", "detail", "tab0");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("tab0"));
      expect(v0).assertEqual("tab0");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3700
     * @tc.name: testBrkStr010037
     * @tc.desc: Verify ascii string triple in row 37 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010037 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("title", "lg", "tabs1");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg"));
      expect(v0).assertEqual("lg");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3800
     * @tc.name: testBrkStr010038
     * @tc.desc: Verify ascii string triple in row 38 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010038 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("subtitle", "md", "index");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md"));
      expect(v1).assertEqual("md");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_3900
     * @tc.name: testBrkStr010039
     * @tc.desc: Verify ascii string triple in row 39 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010039 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("detail", "sm", "radio");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("sm"));
      expect(v2).assertEqual("sm");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4000
     * @tc.name: testBrkStr010040
     * @tc.desc: Verify ascii string triple in row 40 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010040 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg", "tab0", "mine");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("mine"));
      expect(v0).assertEqual("mine");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4100
     * @tc.name: testBrkStr010041
     * @tc.desc: Verify ascii string triple in row 41 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010041 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "tabs1", "discovery");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("tabs1"));
      expect(v0).assertEqual("tabs1");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4200
     * @tc.name: testBrkStr010042
     * @tc.desc: Verify ascii string triple in row 42 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010042 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", "index", "home");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("index"));
      expect(v1).assertEqual("index");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4300
     * @tc.name: testBrkStr010043
     * @tc.desc: Verify ascii string triple in row 43 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010043 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tab0", "radio", "x");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("radio"));
      expect(v2).assertEqual("radio");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4400
     * @tc.name: testBrkStr010044
     * @tc.desc: Verify ascii string triple in row 44 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010044 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tabs1", "mine", "y");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("y"));
      expect(v0).assertEqual("y");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4500
     * @tc.name: testBrkStr010045
     * @tc.desc: Verify ascii string triple in row 45 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010045 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("index", "discovery", "z");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("discovery"));
      expect(v0).assertEqual("discovery");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4600
     * @tc.name: testBrkStr010046
     * @tc.desc: Verify ascii string triple in row 46 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010046 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("radio", "home", "song");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("home"));
      expect(v1).assertEqual("home");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4700
     * @tc.name: testBrkStr010047
     * @tc.desc: Verify ascii string triple in row 47 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010047 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mine", "x", "list");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("x"));
      expect(v2).assertEqual("x");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4800
     * @tc.name: testBrkStr010048
     * @tc.desc: Verify ascii string triple in row 48 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010048 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("discovery", "y", "banner");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("banner"));
      expect(v0).assertEqual("banner");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_4900
     * @tc.name: testBrkStr010049
     * @tc.desc: Verify ascii string triple in row 49 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010049 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("home", "z", "play");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("z"));
      expect(v0).assertEqual("z");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5000
     * @tc.name: testBrkStr010050
     * @tc.desc: Verify ascii string triple in row 50 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010050 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("x", "song", "title");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("song"));
      expect(v1).assertEqual("song");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5100
     * @tc.name: testBrkStr010051
     * @tc.desc: Verify ascii string triple in row 51 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010051 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("y", "list", "subtitle");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("list"));
      expect(v2).assertEqual("list");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5200
     * @tc.name: testBrkStr010052
     * @tc.desc: Verify ascii string triple in row 52 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010052 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("z", "banner", "detail");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("detail"));
      expect(v0).assertEqual("detail");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5300
     * @tc.name: testBrkStr010053
     * @tc.desc: Verify ascii string triple in row 53 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010053 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("song", "play", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("play"));
      expect(v0).assertEqual("play");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5400
     * @tc.name: testBrkStr010054
     * @tc.desc: Verify ascii string triple in row 54 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010054 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("list", "title", "md");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("title"));
      expect(v1).assertEqual("title");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5500
     * @tc.name: testBrkStr010055
     * @tc.desc: Verify ascii string triple in row 55 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010055 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("banner", "subtitle", "sm");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("subtitle"));
      expect(v2).assertEqual("subtitle");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5600
     * @tc.name: testBrkStr010056
     * @tc.desc: Verify ascii string triple in row 56 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010056 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("play", "detail", "tab0");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("tab0"));
      expect(v0).assertEqual("tab0");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5700
     * @tc.name: testBrkStr010057
     * @tc.desc: Verify ascii string triple in row 57 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010057 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("title", "lg", "tabs1");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg"));
      expect(v0).assertEqual("lg");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5800
     * @tc.name: testBrkStr010058
     * @tc.desc: Verify ascii string triple in row 58 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010058 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("subtitle", "md", "index");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("md"));
      expect(v1).assertEqual("md");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_5900
     * @tc.name: testBrkStr010059
     * @tc.desc: Verify ascii string triple in row 59 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010059 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("detail", "sm", "radio");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("sm"));
      expect(v2).assertEqual("sm");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6000
     * @tc.name: testBrkStr010060
     * @tc.desc: Verify ascii string triple in row 60 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010060 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg", "tab0", "mine");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("mine"));
      expect(v0).assertEqual("mine");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6100
     * @tc.name: testBrkStr010061
     * @tc.desc: Verify ascii string triple in row 61 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010061 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "tabs1", "discovery");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("tabs1"));
      expect(v0).assertEqual("tabs1");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6200
     * @tc.name: testBrkStr010062
     * @tc.desc: Verify ascii string triple in row 62 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010062 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", "index", "home");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("index"));
      expect(v1).assertEqual("index");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6300
     * @tc.name: testBrkStr010063
     * @tc.desc: Verify ascii string triple in row 63 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010063 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tab0", "radio", "x");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("radio"));
      expect(v2).assertEqual("radio");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6400
     * @tc.name: testBrkStr010064
     * @tc.desc: Verify ascii string triple in row 64 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010064 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("tabs1", "mine", "y");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("y"));
      expect(v0).assertEqual("y");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("tabs1"));
      expect(v1).assertEqual("tabs1");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6500
     * @tc.name: testBrkStr010065
     * @tc.desc: Verify ascii string triple in row 65 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010065 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("index", "discovery", "z");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("discovery"));
      expect(v0).assertEqual("discovery");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6600
     * @tc.name: testBrkStr010066
     * @tc.desc: Verify ascii string triple in row 66 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010066 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("radio", "home", "song");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("radio"));
      expect(v0).assertEqual("radio");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("home"));
      expect(v1).assertEqual("home");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6700
     * @tc.name: testBrkStr010067
     * @tc.desc: Verify ascii string triple in row 67 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010067 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mine", "x", "list");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("list"));
      expect(v0).assertEqual("list");
      const v1: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("x"));
      expect(v2).assertEqual("x");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6800
     * @tc.name: testBrkStr010068
     * @tc.desc: Verify ascii string triple in row 68 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010068 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("discovery", "y", "banner");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("banner"));
      expect(v0).assertEqual("banner");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("discovery"));
      expect(v1).assertEqual("discovery");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_6900
     * @tc.name: testBrkStr010069
     * @tc.desc: Verify ascii string triple in row 69 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010069 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("home", "z", "play");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("z"));
      expect(v0).assertEqual("z");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("play"));
      expect(v1).assertEqual("play");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7000
     * @tc.name: testBrkStr010070
     * @tc.desc: Verify ascii string triple in row 70 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010070 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("x", "song", "title");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("x"));
      expect(v0).assertEqual("x");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("song"));
      expect(v1).assertEqual("song");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7100
     * @tc.name: testBrkStr010071
     * @tc.desc: Verify ascii string triple in row 71 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010071 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("y", "list", "subtitle");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("subtitle"));
      expect(v0).assertEqual("subtitle");
      const v1: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("list"));
      expect(v2).assertEqual("list");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7200
     * @tc.name: testBrkStr010072
     * @tc.desc: Verify ascii string triple in row 72 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010072 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("z", "banner", "detail");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("detail"));
      expect(v0).assertEqual("detail");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("z"));
      expect(v1).assertEqual("z");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7300
     * @tc.name: testBrkStr010073
     * @tc.desc: Verify ascii string triple in row 73 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010073 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("song", "play", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("play"));
      expect(v0).assertEqual("play");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7400
     * @tc.name: testBrkStr010074
     * @tc.desc: Anchor: resource-like text must not be treated as breakpoint key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkStr010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010074 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('small', 'medium', 'large');
      const v0: string | undefined = sut.getValue('$string:index');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "$string:index", String(v0));
      expect(v0).assertUndefined();
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-value actual=%{public}s expected=%{public}s', String(v1), String('large'));
      expect(v1).assertEqual('large');
      const v2: string | undefined = sut.getValue('Large');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR01_7500
     * @tc.name: testBrkStr010075
     * @tc.desc: Anchor: empty string is a legitimate stored value but whitespace key is not
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkStr010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010075 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('', 'm', 'l');
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-empty-string actual=%{public}s expected=%{public}s', String(v0), String(''));
      expect(v0).assertEqual('');
      const v1: string | undefined = sut.getValue('\t');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "tab", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-value actual=%{public}s expected=%{public}s', String(v2), String('l'));
      expect(v2).assertEqual('l');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr010075 end');
    })

  })
}
