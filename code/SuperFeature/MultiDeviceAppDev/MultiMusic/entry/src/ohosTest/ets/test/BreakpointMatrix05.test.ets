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

// @volume rule=getValue(k)-returns-field-k-for-unicode-and-long-strings,else-undefined basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName, labelPrefixByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix05Test() {
  describe('BreakpointMatrix05', () => {

    /**
     * @tc.number: SUB_MM_BRKSTR02_0100
     * @tc.name: testBrkStr020001
     * @tc.desc: Verify unicode or long string triple in row 1 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020001 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("LG", "", labelByName('index'));
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0200
     * @tc.name: testBrkStr020002
     * @tc.desc: Verify unicode or long string triple in row 2 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020002 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", " ", labelByName('recommend'));
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(" "));
      expect(v1).assertEqual(" ");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0300
     * @tc.name: testBrkStr020003
     * @tc.desc: Verify unicode or long string triple in row 3 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020003 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "\t", labelByName('singList'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("\t"));
      expect(v2).assertEqual("\t");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0400
     * @tc.name: testBrkStr020004
     * @tc.desc: Verify unicode or long string triple in row 4 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020004 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("", "\n", labelPrefixByName('song_label_01'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(""));
      expect(v1).assertEqual("");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0500
     * @tc.name: testBrkStr020005
     * @tc.desc: Verify unicode or long string triple in row 5 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020005 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(" ", labelByName('index'), "emoji-🎵");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(labelByName('index')));
      expect(v0).assertEqual(labelByName('index'));
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0600
     * @tc.name: testBrkStr020006
     * @tc.desc: Verify unicode or long string triple in row 6 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020006 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\t", labelByName('recommend'), "éèê");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("\t"));
      expect(v0).assertEqual("\t");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(labelByName('recommend')));
      expect(v1).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0700
     * @tc.name: testBrkStr020007
     * @tc.desc: Verify unicode or long string triple in row 7 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020007 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\n", labelByName('singList'), "hello world");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String(labelByName('singList')));
      expect(v2).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0800
     * @tc.name: testBrkStr020008
     * @tc.desc: Verify unicode or long string triple in row 8 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020008 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('index'), labelPrefixByName('song_label_01'), "a\"b");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("a\"b"));
      expect(v0).assertEqual("a\"b");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_0900
     * @tc.name: testBrkStr020009
     * @tc.desc: Verify unicode or long string triple in row 9 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020009 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('recommend'), "emoji-🎵", "a'b");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("emoji-🎵"));
      expect(v0).assertEqual("emoji-🎵");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1000
     * @tc.name: testBrkStr020010
     * @tc.desc: Verify unicode or long string triple in row 10 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020010 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('singList'), "éèê", "a\\b");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("éèê"));
      expect(v1).assertEqual("éèê");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1100
     * @tc.name: testBrkStr020011
     * @tc.desc: Verify unicode or long string triple in row 11 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020011 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelPrefixByName('song_label_01'), "hello world", "$string:index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("$string:index"));
      expect(v0).assertEqual("$string:index");
      const v1: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("hello world"));
      expect(v2).assertEqual("hello world");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1200
     * @tc.name: testBrkStr020012
     * @tc.desc: Verify unicode or long string triple in row 12 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020012 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("emoji-🎵", "a\"b", "app.string.index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("app.string.index"));
      expect(v0).assertEqual("app.string.index");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1300
     * @tc.name: testBrkStr020013
     * @tc.desc: Verify unicode or long string triple in row 13 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020013 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("éèê", "a'b", "lg|md");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("a'b"));
      expect(v0).assertEqual("a'b");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg|md"));
      expect(v1).assertEqual("lg|md");
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1400
     * @tc.name: testBrkStr020014
     * @tc.desc: Verify unicode or long string triple in row 14 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020014 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("hello world", "a\\b", "0");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("a\\b"));
      expect(v1).assertEqual("a\\b");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1500
     * @tc.name: testBrkStr020015
     * @tc.desc: Verify unicode or long string triple in row 15 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020015 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\"b", "$string:index", "-1");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("-1"));
      expect(v0).assertEqual("-1");
      const v1: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("$string:index"));
      expect(v2).assertEqual("$string:index");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1600
     * @tc.name: testBrkStr020016
     * @tc.desc: Verify unicode or long string triple in row 16 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020016 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a'b", "app.string.index", "[object Object]");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("[object Object]"));
      expect(v0).assertEqual("[object Object]");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1700
     * @tc.name: testBrkStr020017
     * @tc.desc: Verify unicode or long string triple in row 17 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020017 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\\b", "lg|md", "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg|md"));
      expect(v0).assertEqual("lg|md");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v1).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1800
     * @tc.name: testBrkStr020018
     * @tc.desc: Verify unicode or long string triple in row 18 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020018 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("$string:index", "0", "歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("$string:index"));
      expect(v0).assertEqual("$string:index");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("0"));
      expect(v1).assertEqual("0");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_1900
     * @tc.name: testBrkStr020019
     * @tc.desc: Verify unicode or long string triple in row 19 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020019 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("app.string.index", "-1", "   leading and trailing   ");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("   leading and trailing   "));
      expect(v0).assertEqual("   leading and trailing   ");
      const v1: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("-1"));
      expect(v2).assertEqual("-1");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2000
     * @tc.name: testBrkStr020020
     * @tc.desc: Verify unicode or long string triple in row 20 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020020 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg|md", "[object Object]", "mixed中文andEnglish");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("mixed中文andEnglish"));
      expect(v0).assertEqual("mixed中文andEnglish");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg|md"));
      expect(v1).assertEqual("lg|md");
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2100
     * @tc.name: testBrkStr020021
     * @tc.desc: Verify unicode or long string triple in row 21 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020021 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("0", "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v0).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2200
     * @tc.name: testBrkStr020022
     * @tc.desc: Verify unicode or long string triple in row 22 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020022 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("-1", "歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌", "LG");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("-1"));
      expect(v0).assertEqual("-1");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌"));
      expect(v1).assertEqual("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2300
     * @tc.name: testBrkStr020023
     * @tc.desc: Verify unicode or long string triple in row 23 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020023 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("[object Object]", "   leading and trailing   ", "sm");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("   leading and trailing   "));
      expect(v2).assertEqual("   leading and trailing   ");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2400
     * @tc.name: testBrkStr020024
     * @tc.desc: Verify unicode or long string triple in row 24 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020024 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr", "mixed中文andEnglish", "md");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("md"));
      expect(v0).assertEqual("md");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v1).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2500
     * @tc.name: testBrkStr020025
     * @tc.desc: Verify unicode or long string triple in row 25 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020025 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌", "lg", "");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg"));
      expect(v0).assertEqual("lg");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(""));
      expect(v1).assertEqual("");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2600
     * @tc.name: testBrkStr020026
     * @tc.desc: Verify unicode or long string triple in row 26 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020026 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("   leading and trailing   ", "LG", " ");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("   leading and trailing   "));
      expect(v0).assertEqual("   leading and trailing   ");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("LG"));
      expect(v1).assertEqual("LG");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2700
     * @tc.name: testBrkStr020027
     * @tc.desc: Verify unicode or long string triple in row 27 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020027 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mixed中文andEnglish", "sm", "\t");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("\t"));
      expect(v0).assertEqual("\t");
      const v1: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("sm"));
      expect(v2).assertEqual("sm");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2800
     * @tc.name: testBrkStr020028
     * @tc.desc: Verify unicode or long string triple in row 28 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020028 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg", "md", "\n");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("\n"));
      expect(v0).assertEqual("\n");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_2900
     * @tc.name: testBrkStr020029
     * @tc.desc: Verify unicode or long string triple in row 29 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020029 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("LG", "", labelByName('index'));
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3000
     * @tc.name: testBrkStr020030
     * @tc.desc: Verify unicode or long string triple in row 30 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020030 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", " ", labelByName('recommend'));
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(" "));
      expect(v1).assertEqual(" ");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3100
     * @tc.name: testBrkStr020031
     * @tc.desc: Verify unicode or long string triple in row 31 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020031 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "\t", labelByName('singList'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("\t"));
      expect(v2).assertEqual("\t");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3200
     * @tc.name: testBrkStr020032
     * @tc.desc: Verify unicode or long string triple in row 32 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020032 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("", "\n", labelPrefixByName('song_label_01'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(""));
      expect(v1).assertEqual("");
      const v2: string | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3300
     * @tc.name: testBrkStr020033
     * @tc.desc: Verify unicode or long string triple in row 33 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020033 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(" ", labelByName('index'), "emoji-🎵");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(labelByName('index')));
      expect(v0).assertEqual(labelByName('index'));
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3400
     * @tc.name: testBrkStr020034
     * @tc.desc: Verify unicode or long string triple in row 34 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020034 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\t", labelByName('recommend'), "éèê");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("\t"));
      expect(v0).assertEqual("\t");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(labelByName('recommend')));
      expect(v1).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3500
     * @tc.name: testBrkStr020035
     * @tc.desc: Verify unicode or long string triple in row 35 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020035 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\n", labelByName('singList'), "hello world");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String(labelByName('singList')));
      expect(v2).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3600
     * @tc.name: testBrkStr020036
     * @tc.desc: Verify unicode or long string triple in row 36 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020036 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('index'), labelPrefixByName('song_label_01'), "a\"b");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("a\"b"));
      expect(v0).assertEqual("a\"b");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3700
     * @tc.name: testBrkStr020037
     * @tc.desc: Verify unicode or long string triple in row 37 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020037 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('recommend'), "emoji-🎵", "a'b");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("emoji-🎵"));
      expect(v0).assertEqual("emoji-🎵");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3800
     * @tc.name: testBrkStr020038
     * @tc.desc: Verify unicode or long string triple in row 38 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020038 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('singList'), "éèê", "a\\b");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("éèê"));
      expect(v1).assertEqual("éèê");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_3900
     * @tc.name: testBrkStr020039
     * @tc.desc: Verify unicode or long string triple in row 39 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020039 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelPrefixByName('song_label_01'), "hello world", "$string:index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("$string:index"));
      expect(v0).assertEqual("$string:index");
      const v1: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("hello world"));
      expect(v2).assertEqual("hello world");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4000
     * @tc.name: testBrkStr020040
     * @tc.desc: Verify unicode or long string triple in row 40 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020040 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("emoji-🎵", "a\"b", "app.string.index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("app.string.index"));
      expect(v0).assertEqual("app.string.index");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4100
     * @tc.name: testBrkStr020041
     * @tc.desc: Verify unicode or long string triple in row 41 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020041 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("éèê", "a'b", "lg|md");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("a'b"));
      expect(v0).assertEqual("a'b");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg|md"));
      expect(v1).assertEqual("lg|md");
      const v2: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4200
     * @tc.name: testBrkStr020042
     * @tc.desc: Verify unicode or long string triple in row 42 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020042 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("hello world", "a\\b", "0");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("a\\b"));
      expect(v1).assertEqual("a\\b");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4300
     * @tc.name: testBrkStr020043
     * @tc.desc: Verify unicode or long string triple in row 43 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020043 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\"b", "$string:index", "-1");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("-1"));
      expect(v0).assertEqual("-1");
      const v1: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("$string:index"));
      expect(v2).assertEqual("$string:index");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4400
     * @tc.name: testBrkStr020044
     * @tc.desc: Verify unicode or long string triple in row 44 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020044 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a'b", "app.string.index", "[object Object]");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("[object Object]"));
      expect(v0).assertEqual("[object Object]");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4500
     * @tc.name: testBrkStr020045
     * @tc.desc: Verify unicode or long string triple in row 45 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020045 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\\b", "lg|md", "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg|md"));
      expect(v0).assertEqual("lg|md");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v1).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v2: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4600
     * @tc.name: testBrkStr020046
     * @tc.desc: Verify unicode or long string triple in row 46 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020046 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("$string:index", "0", "歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("$string:index"));
      expect(v0).assertEqual("$string:index");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("0"));
      expect(v1).assertEqual("0");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4700
     * @tc.name: testBrkStr020047
     * @tc.desc: Verify unicode or long string triple in row 47 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020047 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("app.string.index", "-1", "   leading and trailing   ");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("   leading and trailing   "));
      expect(v0).assertEqual("   leading and trailing   ");
      const v1: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("-1"));
      expect(v2).assertEqual("-1");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4800
     * @tc.name: testBrkStr020048
     * @tc.desc: Verify unicode or long string triple in row 48 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020048 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg|md", "[object Object]", "mixed中文andEnglish");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("mixed中文andEnglish"));
      expect(v0).assertEqual("mixed中文andEnglish");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg|md"));
      expect(v1).assertEqual("lg|md");
      const v2: string | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_4900
     * @tc.name: testBrkStr020049
     * @tc.desc: Verify unicode or long string triple in row 49 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020049 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("0", "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr", "lg");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v0).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5000
     * @tc.name: testBrkStr020050
     * @tc.desc: Verify unicode or long string triple in row 50 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020050 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("-1", "歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌", "LG");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("-1"));
      expect(v0).assertEqual("-1");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌"));
      expect(v1).assertEqual("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5100
     * @tc.name: testBrkStr020051
     * @tc.desc: Verify unicode or long string triple in row 51 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020051 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("[object Object]", "   leading and trailing   ", "sm");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("   leading and trailing   "));
      expect(v2).assertEqual("   leading and trailing   ");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5200
     * @tc.name: testBrkStr020052
     * @tc.desc: Verify unicode or long string triple in row 52 resolves per key and rejects "mds".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020052 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr", "mixed中文andEnglish", "md");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("md"));
      expect(v0).assertEqual("md");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v1).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v2: string | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5300
     * @tc.name: testBrkStr020053
     * @tc.desc: Verify unicode or long string triple in row 53 resolves per key and rejects "s".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020053 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌歌", "lg", "");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg"));
      expect(v0).assertEqual("lg");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(""));
      expect(v1).assertEqual("");
      const v2: string | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5400
     * @tc.name: testBrkStr020054
     * @tc.desc: Verify unicode or long string triple in row 54 resolves per key and rejects "undefined".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020054 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("   leading and trailing   ", "LG", " ");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("   leading and trailing   "));
      expect(v0).assertEqual("   leading and trailing   ");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("LG"));
      expect(v1).assertEqual("LG");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5500
     * @tc.name: testBrkStr020055
     * @tc.desc: Verify unicode or long string triple in row 55 resolves per key and rejects "null".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020055 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("mixed中文andEnglish", "sm", "\t");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("\t"));
      expect(v0).assertEqual("\t");
      const v1: string | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("sm"));
      expect(v2).assertEqual("sm");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5600
     * @tc.name: testBrkStr020056
     * @tc.desc: Verify unicode or long string triple in row 56 resolves per key and rejects "0".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020056 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("lg", "md", "\n");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("\n"));
      expect(v0).assertEqual("\n");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("lg"));
      expect(v1).assertEqual("lg");
      const v2: string | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5700
     * @tc.name: testBrkStr020057
     * @tc.desc: Verify unicode or long string triple in row 57 resolves per key and rejects "12".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020057 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("LG", "", labelByName('index'));
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5800
     * @tc.name: testBrkStr020058
     * @tc.desc: Verify unicode or long string triple in row 58 resolves per key and rejects "xl".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020058 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("sm", " ", labelByName('recommend'));
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("sm"));
      expect(v0).assertEqual("sm");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(" "));
      expect(v1).assertEqual(" ");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_5900
     * @tc.name: testBrkStr020059
     * @tc.desc: Verify unicode or long string triple in row 59 resolves per key and rejects "SML".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020059 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("md", "\t", labelByName('singList'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("\t"));
      expect(v2).assertEqual("\t");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6000
     * @tc.name: testBrkStr020060
     * @tc.desc: Verify unicode or long string triple in row 60 resolves per key and rejects "md\t".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020060 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("", "\n", labelPrefixByName('song_label_01'));
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(""));
      expect(v1).assertEqual("");
      const v2: string | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6100
     * @tc.name: testBrkStr020061
     * @tc.desc: Verify unicode or long string triple in row 61 resolves per key and rejects "lg2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020061 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(" ", labelByName('index'), "emoji-🎵");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String(labelByName('index')));
      expect(v0).assertEqual(labelByName('index'));
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6200
     * @tc.name: testBrkStr020062
     * @tc.desc: Verify unicode or long string triple in row 62 resolves per key and rejects "m".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020062 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\t", labelByName('recommend'), "éèê");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("\t"));
      expect(v0).assertEqual("\t");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String(labelByName('recommend')));
      expect(v1).assertEqual(labelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6300
     * @tc.name: testBrkStr020063
     * @tc.desc: Verify unicode or long string triple in row 63 resolves per key and rejects "med".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020063 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("\n", labelByName('singList'), "hello world");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String(labelByName('singList')));
      expect(v2).assertEqual(labelByName('singList'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6400
     * @tc.name: testBrkStr020064
     * @tc.desc: Verify unicode or long string triple in row 64 resolves per key and rejects "SMALL".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020064 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('index'), labelPrefixByName('song_label_01'), "a\"b");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("a\"b"));
      expect(v0).assertEqual("a\"b");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String(labelByName('index')));
      expect(v1).assertEqual(labelByName('index'));
      const v2: string | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6500
     * @tc.name: testBrkStr020065
     * @tc.desc: Verify unicode or long string triple in row 65 resolves per key and rejects "largeScreen".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020065 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('recommend'), "emoji-🎵", "a'b");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("emoji-🎵"));
      expect(v0).assertEqual("emoji-🎵");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6600
     * @tc.name: testBrkStr020066
     * @tc.desc: Verify unicode or long string triple in row 66 resolves per key and rejects "".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020066 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelByName('singList'), "éèê", "a\\b");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singList')));
      expect(v0).assertEqual(labelByName('singList'));
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("éèê"));
      expect(v1).assertEqual("éèê");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6700
     * @tc.name: testBrkStr020067
     * @tc.desc: Verify unicode or long string triple in row 67 resolves per key and rejects "LG".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020067 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>(labelPrefixByName('song_label_01'), "hello world", "$string:index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("$string:index"));
      expect(v0).assertEqual("$string:index");
      const v1: string | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("hello world"));
      expect(v2).assertEqual("hello world");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6800
     * @tc.name: testBrkStr020068
     * @tc.desc: Verify unicode or long string triple in row 68 resolves per key and rejects "Lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020068 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("emoji-🎵", "a\"b", "app.string.index");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("app.string.index"));
      expect(v0).assertEqual("app.string.index");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("emoji-🎵"));
      expect(v1).assertEqual("emoji-🎵");
      const v2: string | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_6900
     * @tc.name: testBrkStr020069
     * @tc.desc: Verify unicode or long string triple in row 69 resolves per key and rejects "lg ".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020069 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("éèê", "a'b", "lg|md");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("a'b"));
      expect(v0).assertEqual("a'b");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("lg|md"));
      expect(v1).assertEqual("lg|md");
      const v2: string | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7000
     * @tc.name: testBrkStr020070
     * @tc.desc: Verify unicode or long string triple in row 70 resolves per key and rejects " lg".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020070 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("hello world", "a\\b", "0");
      const v0: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v0), String("hello world"));
      expect(v0).assertEqual("hello world");
      const v1: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v1), String("a\\b"));
      expect(v1).assertEqual("a\\b");
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.sm === sut.getValue('sm')));
      expect(sut.sm === sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7100
     * @tc.name: testBrkStr020071
     * @tc.desc: Verify unicode or long string triple in row 71 resolves per key and rejects "large".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020071 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\"b", "$string:index", "-1");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("-1"));
      expect(v0).assertEqual("-1");
      const v1: string | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v1));
      expect(v1).assertUndefined();
      const v2: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v2), String("$string:index"));
      expect(v2).assertEqual("$string:index");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7200
     * @tc.name: testBrkStr020072
     * @tc.desc: Verify unicode or long string triple in row 72 resolves per key and rejects "sm2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020072 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a'b", "app.string.index", "[object Object]");
      const v0: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v0), String("[object Object]"));
      expect(v0).assertEqual("[object Object]");
      const v1: string | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm actual=%{public}s expected=%{public}s', String(v1), String("a'b"));
      expect(v1).assertEqual("a'b");
      const v2: string | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7300
     * @tc.name: testBrkStr020073
     * @tc.desc: Verify unicode or long string triple in row 73 resolves per key and rejects "Md".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkStr020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020073 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>("a\\b", "lg|md", "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v0: string | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md actual=%{public}s expected=%{public}s', String(v0), String("lg|md"));
      expect(v0).assertEqual("lg|md");
      const v1: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg actual=%{public}s expected=%{public}s', String(v1), String("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr"));
      expect(v1).assertEqual("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr");
      const v2: string | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7400
     * @tc.name: testBrkStr020074
     * @tc.desc: Anchor: empty string is a legitimate stored value but whitespace key is not
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkStr020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020074 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKSTR02_7500
     * @tc.name: testBrkStr020075
     * @tc.desc: Anchor: resource-like text must not be treated as breakpoint key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkStr020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020075 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkStr020075 end');
    })

  })
}
