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

// @volume rule=getValue(k)-returns-field-k,Resource-identity-kept basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { BUNDLE_NAME, TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix11Test() {
  describe('BreakpointMatrix11', () => {

    /**
     * @tc.number: SUB_MM_BRKRES01_0100
     * @tc.name: testBrkRes010001
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010001 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list2'), $r('app.media.list8'), $r('app.media.banner1'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      const v2: Resource | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0200
     * @tc.name: testBrkRes010002
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010002 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list3'), $r('app.media.list9'), $r('app.media.banner2'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner2').id));
      expect(v0).assertEqual($r('app.media.banner2').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0300
     * @tc.name: testBrkRes010003
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010003 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list4'), $r('app.media.list10'), $r('app.media.banner3'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      const v2: Resource | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0400
     * @tc.name: testBrkRes010004
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010004 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list5'), $r('app.media.list11'), $r('app.media.ic_find'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find').id));
      expect(v0).assertEqual($r('app.media.ic_find').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0500
     * @tc.name: testBrkRes010005
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010005 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list6'), $r('app.media.list12'), $r('app.media.ic_find_h'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      const v2: Resource | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0600
     * @tc.name: testBrkRes010006
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010006 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list7'), $r('app.media.list13'), $r('app.media.ic_home'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_home').id));
      expect(v0).assertEqual($r('app.media.ic_home').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0700
     * @tc.name: testBrkRes010007
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010007 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list8'), $r('app.media.banner1'), $r('app.media.ic_listener'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      const v2: Resource | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0800
     * @tc.name: testBrkRes010008
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010008 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list9'), $r('app.media.banner2'), $r('app.media.ic_mine'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine').id));
      expect(v0).assertEqual($r('app.media.ic_mine').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_0900
     * @tc.name: testBrkRes010009
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010009 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list10'), $r('app.media.banner3'), $r('app.media.ic_mine_h'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      const v2: Resource | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1000
     * @tc.name: testBrkRes010010
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010010 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list11'), $r('app.media.ic_find'), $r('app.media.ic_more'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_more').id));
      expect(v0).assertEqual($r('app.media.ic_more').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1100
     * @tc.name: testBrkRes010011
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010011 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list12'), $r('app.media.ic_find_h'), $r('app.media.ic_music_Album'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      const v2: Resource | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1200
     * @tc.name: testBrkRes010012
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010012 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list13'), $r('app.media.ic_home'), $r('app.media.ic_music_children'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_children').id));
      expect(v0).assertEqual($r('app.media.ic_music_children').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1300
     * @tc.name: testBrkRes010013
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010013 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner1'), $r('app.media.ic_listener'), $r('app.media.ic_music_hires'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      const v2: Resource | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1400
     * @tc.name: testBrkRes010014
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010014 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner2'), $r('app.media.ic_mine'), $r('app.media.ic_music_localmusic'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_localmusic').id));
      expect(v0).assertEqual($r('app.media.ic_music_localmusic').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1500
     * @tc.name: testBrkRes010015
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010015 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner3'), $r('app.media.ic_mine_h'), $r('app.media.ic_music_musicfm'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      const v2: Resource | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1600
     * @tc.name: testBrkRes010016
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010016 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_find'), $r('app.media.ic_more'), $r('app.media.ic_music_privatefm'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_privatefm').id));
      expect(v0).assertEqual($r('app.media.ic_music_privatefm').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1700
     * @tc.name: testBrkRes010017
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010017 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_find_h'), $r('app.media.ic_music_Album'), $r('app.media.ic_music_ranking'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      const v2: Resource | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1800
     * @tc.name: testBrkRes010018
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010018 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_home'), $r('app.media.ic_music_children'), $r('app.media.ic_music_singer'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_singer').id));
      expect(v0).assertEqual($r('app.media.ic_music_singer').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_1900
     * @tc.name: testBrkRes010019
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010019 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_listener'), $r('app.media.ic_music_hires'), $r('app.media.ic_music_songsheet'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      const v2: Resource | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2000
     * @tc.name: testBrkRes010020
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010020 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_mine'), $r('app.media.ic_music_localmusic'), $r('app.media.ic_play'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_play').id));
      expect(v0).assertEqual($r('app.media.ic_play').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2100
     * @tc.name: testBrkRes010021
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010021 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_mine_h'), $r('app.media.ic_music_musicfm'), $r('app.media.ic_playList'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      const v2: Resource | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2200
     * @tc.name: testBrkRes010022
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010022 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_more'), $r('app.media.ic_music_privatefm'), $r('app.media.ic_public_arrow_right'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_arrow_right').id));
      expect(v0).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2300
     * @tc.name: testBrkRes010023
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010023 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_Album'), $r('app.media.ic_music_ranking'), $r('app.media.ic_public_home'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      const v2: Resource | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2400
     * @tc.name: testBrkRes010024
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010024 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_children'), $r('app.media.ic_music_singer'), $r('app.media.ic_public_home_filled'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home_filled').id));
      expect(v0).assertEqual($r('app.media.ic_public_home_filled').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2500
     * @tc.name: testBrkRes010025
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010025 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_hires'), $r('app.media.ic_music_songsheet'), $r('app.media.ic_radio'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      const v2: Resource | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2600
     * @tc.name: testBrkRes010026
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010026 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_localmusic'), $r('app.media.ic_play'), $r('app.media.ic_radio_h'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio_h').id));
      expect(v0).assertEqual($r('app.media.ic_radio_h').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2700
     * @tc.name: testBrkRes010027
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010027 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_musicfm'), $r('app.media.ic_playList'), $r('app.media.ic_search'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      const v2: Resource | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2800
     * @tc.name: testBrkRes010028
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010028 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_privatefm'), $r('app.media.ic_public_arrow_right'), $r('app.media.icon'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.icon').id));
      expect(v0).assertEqual($r('app.media.icon').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_2900
     * @tc.name: testBrkRes010029
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010029 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_ranking'), $r('app.media.ic_public_home'), $r('app.media.icon_play'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      const v2: Resource | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3000
     * @tc.name: testBrkRes010030
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010030 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_singer'), $r('app.media.ic_public_home_filled'), $r('app.media.play'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.play').id));
      expect(v0).assertEqual($r('app.media.play').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3100
     * @tc.name: testBrkRes010031
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010031 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_songsheet'), $r('app.media.ic_radio'), $r('app.media.list1'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      const v2: Resource | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3200
     * @tc.name: testBrkRes010032
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010032 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_play'), $r('app.media.ic_radio_h'), $r('app.media.list2'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3300
     * @tc.name: testBrkRes010033
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010033 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_playList'), $r('app.media.ic_search'), $r('app.media.list3'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      const v2: Resource | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3400
     * @tc.name: testBrkRes010034
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010034 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_public_arrow_right'), $r('app.media.icon'), $r('app.media.list4'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3500
     * @tc.name: testBrkRes010035
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010035 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_public_home'), $r('app.media.icon_play'), $r('app.media.list5'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      const v2: Resource | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3600
     * @tc.name: testBrkRes010036
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010036 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_public_home_filled'), $r('app.media.play'), $r('app.media.list6'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3700
     * @tc.name: testBrkRes010037
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010037 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_radio'), $r('app.media.list1'), $r('app.media.list7'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      const v2: Resource | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3800
     * @tc.name: testBrkRes010038
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010038 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_radio_h'), $r('app.media.list2'), $r('app.media.list8'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_3900
     * @tc.name: testBrkRes010039
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010039 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_search'), $r('app.media.list3'), $r('app.media.list9'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      const v2: Resource | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4000
     * @tc.name: testBrkRes010040
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010040 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.icon'), $r('app.media.list4'), $r('app.media.list10'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4100
     * @tc.name: testBrkRes010041
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010041 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.icon_play'), $r('app.media.list5'), $r('app.media.list11'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      const v2: Resource | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4200
     * @tc.name: testBrkRes010042
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010042 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.play'), $r('app.media.list6'), $r('app.media.list12'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4300
     * @tc.name: testBrkRes010043
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010043 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list1'), $r('app.media.list7'), $r('app.media.list13'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      const v2: Resource | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4400
     * @tc.name: testBrkRes010044
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010044 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list2'), $r('app.media.list8'), $r('app.media.banner1'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner1').id));
      expect(v0).assertEqual($r('app.media.banner1').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4500
     * @tc.name: testBrkRes010045
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010045 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list3'), $r('app.media.list9'), $r('app.media.banner2'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      const v2: Resource | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4600
     * @tc.name: testBrkRes010046
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010046 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list4'), $r('app.media.list10'), $r('app.media.banner3'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner3').id));
      expect(v0).assertEqual($r('app.media.banner3').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4700
     * @tc.name: testBrkRes010047
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010047 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list5'), $r('app.media.list11'), $r('app.media.ic_find'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      const v2: Resource | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4800
     * @tc.name: testBrkRes010048
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010048 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list6'), $r('app.media.list12'), $r('app.media.ic_find_h'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find_h').id));
      expect(v0).assertEqual($r('app.media.ic_find_h').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_4900
     * @tc.name: testBrkRes010049
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010049 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list7'), $r('app.media.list13'), $r('app.media.ic_home'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      const v2: Resource | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5000
     * @tc.name: testBrkRes010050
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010050 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list8'), $r('app.media.banner1'), $r('app.media.ic_listener'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_listener').id));
      expect(v0).assertEqual($r('app.media.ic_listener').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5100
     * @tc.name: testBrkRes010051
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010051 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list9'), $r('app.media.banner2'), $r('app.media.ic_mine'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      const v2: Resource | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5200
     * @tc.name: testBrkRes010052
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010052 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list10'), $r('app.media.banner3'), $r('app.media.ic_mine_h'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine_h').id));
      expect(v0).assertEqual($r('app.media.ic_mine_h').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5300
     * @tc.name: testBrkRes010053
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010053 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list11'), $r('app.media.ic_find'), $r('app.media.ic_more'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      const v2: Resource | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5400
     * @tc.name: testBrkRes010054
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010054 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list12'), $r('app.media.ic_find_h'), $r('app.media.ic_music_Album'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_Album').id));
      expect(v0).assertEqual($r('app.media.ic_music_Album').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5500
     * @tc.name: testBrkRes010055
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010055 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list13'), $r('app.media.ic_home'), $r('app.media.ic_music_children'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      const v2: Resource | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5600
     * @tc.name: testBrkRes010056
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010056 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner1'), $r('app.media.ic_listener'), $r('app.media.ic_music_hires'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_hires').id));
      expect(v0).assertEqual($r('app.media.ic_music_hires').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5700
     * @tc.name: testBrkRes010057
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010057 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner2'), $r('app.media.ic_mine'), $r('app.media.ic_music_localmusic'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      const v2: Resource | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5800
     * @tc.name: testBrkRes010058
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010058 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner3'), $r('app.media.ic_mine_h'), $r('app.media.ic_music_musicfm'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_musicfm').id));
      expect(v0).assertEqual($r('app.media.ic_music_musicfm').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_5900
     * @tc.name: testBrkRes010059
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010059 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_find'), $r('app.media.ic_more'), $r('app.media.ic_music_privatefm'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      const v2: Resource | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6000
     * @tc.name: testBrkRes010060
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010060 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_find_h'), $r('app.media.ic_music_Album'), $r('app.media.ic_music_ranking'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_ranking').id));
      expect(v0).assertEqual($r('app.media.ic_music_ranking').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6100
     * @tc.name: testBrkRes010061
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010061 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_home'), $r('app.media.ic_music_children'), $r('app.media.ic_music_singer'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      const v2: Resource | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6200
     * @tc.name: testBrkRes010062
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010062 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_listener'), $r('app.media.ic_music_hires'), $r('app.media.ic_music_songsheet'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_songsheet').id));
      expect(v0).assertEqual($r('app.media.ic_music_songsheet').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6300
     * @tc.name: testBrkRes010063
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010063 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_mine'), $r('app.media.ic_music_localmusic'), $r('app.media.ic_play'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      const v2: Resource | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6400
     * @tc.name: testBrkRes010064
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010064 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_mine_h'), $r('app.media.ic_music_musicfm'), $r('app.media.ic_playList'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_playList').id));
      expect(v0).assertEqual($r('app.media.ic_playList').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6500
     * @tc.name: testBrkRes010065
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010065 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_more'), $r('app.media.ic_music_privatefm'), $r('app.media.ic_public_arrow_right'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      const v2: Resource | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6600
     * @tc.name: testBrkRes010066
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010066 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_Album'), $r('app.media.ic_music_ranking'), $r('app.media.ic_public_home'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home').id));
      expect(v0).assertEqual($r('app.media.ic_public_home').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6700
     * @tc.name: testBrkRes010067
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010067 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_children'), $r('app.media.ic_music_singer'), $r('app.media.ic_public_home_filled'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      const v2: Resource | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6800
     * @tc.name: testBrkRes010068
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010068 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_hires'), $r('app.media.ic_music_songsheet'), $r('app.media.ic_radio'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio').id));
      expect(v0).assertEqual($r('app.media.ic_radio').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_6900
     * @tc.name: testBrkRes010069
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010069 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_localmusic'), $r('app.media.ic_play'), $r('app.media.ic_radio_h'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      const v2: Resource | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7000
     * @tc.name: testBrkRes010070
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010070 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_musicfm'), $r('app.media.ic_playList'), $r('app.media.ic_search'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_search').id));
      expect(v0).assertEqual($r('app.media.ic_search').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7100
     * @tc.name: testBrkRes010071
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010071 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_privatefm'), $r('app.media.ic_public_arrow_right'), $r('app.media.icon'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v2: Resource | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7200
     * @tc.name: testBrkRes010072
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010072 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_ranking'), $r('app.media.ic_public_home'), $r('app.media.icon_play'));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.icon_play').id));
      expect(v0).assertEqual($r('app.media.icon_play').id);
      const v1: string = sut.sm.moduleName;
      hilog.info(DOMAIN, TAG, 'sm.moduleName actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      const v2: Resource | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7300
     * @tc.name: testBrkRes010073
     * @tc.desc: Verify Resource value keeps identity and module metadata per key (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkRes010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010073 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.ic_music_singer'), $r('app.media.ic_public_home_filled'), $r('app.media.play'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      const v0: string = sut.sm.bundleName;
      hilog.info(DOMAIN, TAG, 'sm.bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      const v2: Resource | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7400
     * @tc.name: testBrkRes010074
     * @tc.desc: Anchor: resource slots must keep module metadata for each key
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkRes010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010074 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list12'), $r('app.media.list6'), $r('app.media.list1'));
      const v0: number = sut.sm.id;
      hilog.info(DOMAIN, TAG, 'sm-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      const v1: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      const v2: Resource | undefined = sut.getValue('medium');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "medium", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKRES01_7500
     * @tc.name: testBrkRes010075
     * @tc.desc: Anchor: resource id must be positive and module name must be entry_test
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkRes010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010075 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.banner1'), $r('app.media.banner2'), $r('app.media.banner3'));
      hilog.info(DOMAIN, TAG, 'md-id-positive actual=%{public}s expected=true', String(sut.md.id > 0));
      expect(sut.md.id > 0).assertTrue();
      const v0: string = sut.md.moduleName;
      hilog.info(DOMAIN, TAG, 'md-moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, 'banner-ids-differ actual=%{public}s expected=false', String(sut.sm.id === sut.lg.id));
      expect(sut.sm.id === sut.lg.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkRes010075 end');
    })

  })
}
