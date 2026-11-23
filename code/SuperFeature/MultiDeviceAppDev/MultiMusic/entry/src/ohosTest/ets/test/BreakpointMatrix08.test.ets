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

// @volume rule=getValue(k)-returns-IconItem-field-k-by-reference basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix08Test() {
  describe('BreakpointMatrix08', () => {

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0100
     * @tc.name: testBrkObj010001
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010001 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list2'), 'desc-1'), new IconItem($r('app.media.list7'), 'desc-101'), new IconItem($r('app.media.list2'), 'desc-1'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0200
     * @tc.name: testBrkObj010002
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010002 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list3'), 'desc-2'), new IconItem($r('app.media.list8'), 'desc-102'), new IconItem($r('app.media.list3'), 'desc-2'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0300
     * @tc.name: testBrkObj010003
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010003 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list4'), 'desc-3'), new IconItem($r('app.media.list9'), 'desc-103'), new IconItem($r('app.media.list4'), 'desc-3'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0400
     * @tc.name: testBrkObj010004
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010004 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list5'), 'desc-4'), new IconItem($r('app.media.list10'), 'desc-104'), new IconItem($r('app.media.list5'), 'desc-4'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0500
     * @tc.name: testBrkObj010005
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010005 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list6'), 'desc-5'), new IconItem($r('app.media.list11'), 'desc-105'), new IconItem($r('app.media.list6'), 'desc-5'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0600
     * @tc.name: testBrkObj010006
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010006 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list7'), 'desc-6'), new IconItem($r('app.media.list12'), 'desc-106'), new IconItem($r('app.media.list7'), 'desc-6'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0700
     * @tc.name: testBrkObj010007
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010007 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list8'), 'desc-7'), new IconItem($r('app.media.list13'), 'desc-107'), new IconItem($r('app.media.list8'), 'desc-7'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0800
     * @tc.name: testBrkObj010008
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010008 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list9'), 'desc-8'), new IconItem($r('app.media.banner1'), 'desc-108'), new IconItem($r('app.media.list9'), 'desc-8'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_0900
     * @tc.name: testBrkObj010009
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010009 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list10'), 'desc-9'), new IconItem($r('app.media.banner2'), 'desc-109'), new IconItem($r('app.media.list10'), 'desc-9'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1000
     * @tc.name: testBrkObj010010
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010010 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list11'), 'desc-10'), new IconItem($r('app.media.banner3'), 'desc-110'), new IconItem($r('app.media.list11'), 'desc-10'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1100
     * @tc.name: testBrkObj010011
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010011 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list12'), 'desc-11'), new IconItem($r('app.media.ic_find'), 'desc-111'), new IconItem($r('app.media.list12'), 'desc-11'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1200
     * @tc.name: testBrkObj010012
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010012 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list13'), 'desc-12'), new IconItem($r('app.media.ic_find_h'), 'desc-112'), new IconItem($r('app.media.list13'), 'desc-12'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1300
     * @tc.name: testBrkObj010013
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010013 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner1'), 'desc-13'), new IconItem($r('app.media.ic_home'), 'desc-113'), new IconItem($r('app.media.banner1'), 'desc-13'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1400
     * @tc.name: testBrkObj010014
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010014 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner2'), 'desc-14'), new IconItem($r('app.media.ic_listener'), 'desc-114'), new IconItem($r('app.media.banner2'), 'desc-14'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1500
     * @tc.name: testBrkObj010015
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010015 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner3'), 'desc-15'), new IconItem($r('app.media.ic_mine'), 'desc-115'), new IconItem($r('app.media.banner3'), 'desc-15'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1600
     * @tc.name: testBrkObj010016
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010016 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_find'), 'desc-16'), new IconItem($r('app.media.ic_mine_h'), 'desc-116'), new IconItem($r('app.media.ic_find'), 'desc-16'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1700
     * @tc.name: testBrkObj010017
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010017 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_find_h'), 'desc-17'), new IconItem($r('app.media.ic_more'), 'desc-117'), new IconItem($r('app.media.ic_find_h'), 'desc-17'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1800
     * @tc.name: testBrkObj010018
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010018 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_home'), 'desc-18'), new IconItem($r('app.media.ic_music_Album'), 'desc-118'), new IconItem($r('app.media.ic_home'), 'desc-18'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_1900
     * @tc.name: testBrkObj010019
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010019 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_listener'), 'desc-19'), new IconItem($r('app.media.ic_music_children'), 'desc-119'), new IconItem($r('app.media.ic_listener'), 'desc-19'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2000
     * @tc.name: testBrkObj010020
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010020 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_mine'), 'desc-20'), new IconItem($r('app.media.ic_music_hires'), 'desc-120'), new IconItem($r('app.media.ic_mine'), 'desc-20'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2100
     * @tc.name: testBrkObj010021
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010021 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_mine_h'), 'desc-21'), new IconItem($r('app.media.ic_music_localmusic'), 'desc-121'), new IconItem($r('app.media.ic_mine_h'), 'desc-21'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2200
     * @tc.name: testBrkObj010022
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010022 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_more'), 'desc-22'), new IconItem($r('app.media.ic_music_musicfm'), 'desc-122'), new IconItem($r('app.media.ic_more'), 'desc-22'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2300
     * @tc.name: testBrkObj010023
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010023 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_Album'), 'desc-23'), new IconItem($r('app.media.ic_music_privatefm'), 'desc-123'), new IconItem($r('app.media.ic_music_Album'), 'desc-23'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2400
     * @tc.name: testBrkObj010024
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010024 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_children'), 'desc-24'), new IconItem($r('app.media.ic_music_ranking'), 'desc-124'), new IconItem($r('app.media.ic_music_children'), 'desc-24'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2500
     * @tc.name: testBrkObj010025
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010025 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_hires'), 'desc-25'), new IconItem($r('app.media.ic_music_singer'), 'desc-125'), new IconItem($r('app.media.ic_music_hires'), 'desc-25'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2600
     * @tc.name: testBrkObj010026
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010026 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_localmusic'), 'desc-26'), new IconItem($r('app.media.ic_music_songsheet'), 'desc-126'), new IconItem($r('app.media.ic_music_localmusic'), 'desc-26'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2700
     * @tc.name: testBrkObj010027
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010027 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_musicfm'), 'desc-27'), new IconItem($r('app.media.ic_play'), 'desc-127'), new IconItem($r('app.media.ic_music_musicfm'), 'desc-27'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2800
     * @tc.name: testBrkObj010028
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010028 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_privatefm'), 'desc-28'), new IconItem($r('app.media.ic_playList'), 'desc-128'), new IconItem($r('app.media.ic_music_privatefm'), 'desc-28'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_2900
     * @tc.name: testBrkObj010029
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010029 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_ranking'), 'desc-29'), new IconItem($r('app.media.ic_public_arrow_right'), 'desc-129'), new IconItem($r('app.media.ic_music_ranking'), 'desc-29'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3000
     * @tc.name: testBrkObj010030
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010030 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_singer'), 'desc-30'), new IconItem($r('app.media.ic_public_home'), 'desc-130'), new IconItem($r('app.media.ic_music_singer'), 'desc-30'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3100
     * @tc.name: testBrkObj010031
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010031 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_songsheet'), 'desc-31'), new IconItem($r('app.media.ic_public_home_filled'), 'desc-131'), new IconItem($r('app.media.ic_music_songsheet'), 'desc-31'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3200
     * @tc.name: testBrkObj010032
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010032 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_play'), 'desc-32'), new IconItem($r('app.media.ic_radio'), 'desc-132'), new IconItem($r('app.media.ic_play'), 'desc-32'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3300
     * @tc.name: testBrkObj010033
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010033 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_playList'), 'desc-33'), new IconItem($r('app.media.ic_radio_h'), 'desc-133'), new IconItem($r('app.media.ic_playList'), 'desc-33'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3400
     * @tc.name: testBrkObj010034
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010034 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_public_arrow_right'), 'desc-34'), new IconItem($r('app.media.ic_search'), 'desc-134'), new IconItem($r('app.media.ic_public_arrow_right'), 'desc-34'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3500
     * @tc.name: testBrkObj010035
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010035 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_public_home'), 'desc-35'), new IconItem($r('app.media.icon'), 'desc-135'), new IconItem($r('app.media.ic_public_home'), 'desc-35'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3600
     * @tc.name: testBrkObj010036
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010036 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_public_home_filled'), 'desc-36'), new IconItem($r('app.media.icon_play'), 'desc-136'), new IconItem($r('app.media.ic_public_home_filled'), 'desc-36'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3700
     * @tc.name: testBrkObj010037
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010037 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_radio'), 'desc-37'), new IconItem($r('app.media.play'), 'desc-137'), new IconItem($r('app.media.ic_radio'), 'desc-37'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3800
     * @tc.name: testBrkObj010038
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010038 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_radio_h'), 'desc-38'), new IconItem($r('app.media.list1'), 'desc-138'), new IconItem($r('app.media.ic_radio_h'), 'desc-38'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_3900
     * @tc.name: testBrkObj010039
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010039 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_search'), 'desc-39'), new IconItem($r('app.media.list2'), 'desc-139'), new IconItem($r('app.media.ic_search'), 'desc-39'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4000
     * @tc.name: testBrkObj010040
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010040 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.icon'), 'desc-40'), new IconItem($r('app.media.list3'), 'desc-140'), new IconItem($r('app.media.icon'), 'desc-40'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4100
     * @tc.name: testBrkObj010041
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010041 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.icon_play'), 'desc-41'), new IconItem($r('app.media.list4'), 'desc-141'), new IconItem($r('app.media.icon_play'), 'desc-41'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4200
     * @tc.name: testBrkObj010042
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010042 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.play'), 'desc-42'), new IconItem($r('app.media.list5'), 'desc-142'), new IconItem($r('app.media.play'), 'desc-42'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4300
     * @tc.name: testBrkObj010043
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010043 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list1'), 'desc-43'), new IconItem($r('app.media.list6'), 'desc-143'), new IconItem($r('app.media.list1'), 'desc-43'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4400
     * @tc.name: testBrkObj010044
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010044 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list2'), 'desc-44'), new IconItem($r('app.media.list7'), 'desc-144'), new IconItem($r('app.media.list2'), 'desc-44'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4500
     * @tc.name: testBrkObj010045
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010045 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list3'), 'desc-45'), new IconItem($r('app.media.list8'), 'desc-145'), new IconItem($r('app.media.list3'), 'desc-45'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4600
     * @tc.name: testBrkObj010046
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010046 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list4'), 'desc-46'), new IconItem($r('app.media.list9'), 'desc-146'), new IconItem($r('app.media.list4'), 'desc-46'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4700
     * @tc.name: testBrkObj010047
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010047 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list5'), 'desc-47'), new IconItem($r('app.media.list10'), 'desc-147'), new IconItem($r('app.media.list5'), 'desc-47'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4800
     * @tc.name: testBrkObj010048
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010048 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list6'), 'desc-48'), new IconItem($r('app.media.list11'), 'desc-148'), new IconItem($r('app.media.list6'), 'desc-48'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_4900
     * @tc.name: testBrkObj010049
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010049 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list7'), 'desc-49'), new IconItem($r('app.media.list12'), 'desc-149'), new IconItem($r('app.media.list7'), 'desc-49'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5000
     * @tc.name: testBrkObj010050
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010050 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list8'), 'desc-50'), new IconItem($r('app.media.list13'), 'desc-150'), new IconItem($r('app.media.list8'), 'desc-50'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5100
     * @tc.name: testBrkObj010051
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010051 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list9'), 'desc-51'), new IconItem($r('app.media.banner1'), 'desc-151'), new IconItem($r('app.media.list9'), 'desc-51'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5200
     * @tc.name: testBrkObj010052
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010052 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list10'), 'desc-52'), new IconItem($r('app.media.banner2'), 'desc-152'), new IconItem($r('app.media.list10'), 'desc-52'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5300
     * @tc.name: testBrkObj010053
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010053 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list11'), 'desc-53'), new IconItem($r('app.media.banner3'), 'desc-153'), new IconItem($r('app.media.list11'), 'desc-53'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5400
     * @tc.name: testBrkObj010054
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010054 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list12'), 'desc-54'), new IconItem($r('app.media.ic_find'), 'desc-154'), new IconItem($r('app.media.list12'), 'desc-54'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5500
     * @tc.name: testBrkObj010055
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010055 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list13'), 'desc-55'), new IconItem($r('app.media.ic_find_h'), 'desc-155'), new IconItem($r('app.media.list13'), 'desc-55'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5600
     * @tc.name: testBrkObj010056
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010056 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner1'), 'desc-56'), new IconItem($r('app.media.ic_home'), 'desc-156'), new IconItem($r('app.media.banner1'), 'desc-56'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5700
     * @tc.name: testBrkObj010057
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010057 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner2'), 'desc-57'), new IconItem($r('app.media.ic_listener'), 'desc-157'), new IconItem($r('app.media.banner2'), 'desc-57'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5800
     * @tc.name: testBrkObj010058
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010058 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.banner3'), 'desc-58'), new IconItem($r('app.media.ic_mine'), 'desc-158'), new IconItem($r('app.media.banner3'), 'desc-58'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_5900
     * @tc.name: testBrkObj010059
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010059 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_find'), 'desc-59'), new IconItem($r('app.media.ic_mine_h'), 'desc-159'), new IconItem($r('app.media.ic_find'), 'desc-59'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6000
     * @tc.name: testBrkObj010060
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010060 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_find_h'), 'desc-60'), new IconItem($r('app.media.ic_more'), 'desc-160'), new IconItem($r('app.media.ic_find_h'), 'desc-60'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6100
     * @tc.name: testBrkObj010061
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010061 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_home'), 'desc-61'), new IconItem($r('app.media.ic_music_Album'), 'desc-161'), new IconItem($r('app.media.ic_home'), 'desc-61'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6200
     * @tc.name: testBrkObj010062
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010062 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_listener'), 'desc-62'), new IconItem($r('app.media.ic_music_children'), 'desc-162'), new IconItem($r('app.media.ic_listener'), 'desc-62'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6300
     * @tc.name: testBrkObj010063
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010063 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_mine'), 'desc-63'), new IconItem($r('app.media.ic_music_hires'), 'desc-163'), new IconItem($r('app.media.ic_mine'), 'desc-63'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6400
     * @tc.name: testBrkObj010064
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010064 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_mine_h'), 'desc-64'), new IconItem($r('app.media.ic_music_localmusic'), 'desc-164'), new IconItem($r('app.media.ic_mine_h'), 'desc-64'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6500
     * @tc.name: testBrkObj010065
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010065 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_more'), 'desc-65'), new IconItem($r('app.media.ic_music_musicfm'), 'desc-165'), new IconItem($r('app.media.ic_more'), 'desc-65'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6600
     * @tc.name: testBrkObj010066
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010066 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_Album'), 'desc-66'), new IconItem($r('app.media.ic_music_privatefm'), 'desc-166'), new IconItem($r('app.media.ic_music_Album'), 'desc-66'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6700
     * @tc.name: testBrkObj010067
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010067 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_children'), 'desc-67'), new IconItem($r('app.media.ic_music_ranking'), 'desc-167'), new IconItem($r('app.media.ic_music_children'), 'desc-67'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6800
     * @tc.name: testBrkObj010068
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010068 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_hires'), 'desc-68'), new IconItem($r('app.media.ic_music_singer'), 'desc-168'), new IconItem($r('app.media.ic_music_hires'), 'desc-68'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_6900
     * @tc.name: testBrkObj010069
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010069 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_localmusic'), 'desc-69'), new IconItem($r('app.media.ic_music_songsheet'), 'desc-169'), new IconItem($r('app.media.ic_music_localmusic'), 'desc-69'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7000
     * @tc.name: testBrkObj010070
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010070 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_musicfm'), 'desc-70'), new IconItem($r('app.media.ic_play'), 'desc-170'), new IconItem($r('app.media.ic_music_musicfm'), 'desc-70'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7100
     * @tc.name: testBrkObj010071
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010071 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_privatefm'), 'desc-71'), new IconItem($r('app.media.ic_playList'), 'desc-171'), new IconItem($r('app.media.ic_music_privatefm'), 'desc-71'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7200
     * @tc.name: testBrkObj010072
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010072 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_ranking'), 'desc-72'), new IconItem($r('app.media.ic_public_arrow_right'), 'desc-172'), new IconItem($r('app.media.ic_music_ranking'), 'desc-72'));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: IconItem | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7300
     * @tc.name: testBrkObj010073
     * @tc.desc: Verify IconItem instance is stored per breakpoint field and invalid key returns undefined (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010073 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.ic_music_singer'), 'desc-73'), new IconItem($r('app.media.ic_public_home'), 'desc-173'), new IconItem($r('app.media.ic_music_singer'), 'desc-73'));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: IconItem | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7400
     * @tc.name: testBrkObj010074
     * @tc.desc: Anchor: IconItem reference must survive a repeated read
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010074 begin');
      let first: IconItem = new IconItem($r('app.media.list1'), labelByName('song_label_01'));
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(first, first, first);
      hilog.info(DOMAIN, TAG, 'lg-keeps-first-reference actual=%{public}s expected=true', String(sut.getValue('lg') === first));
      expect(sut.getValue('lg') === first).assertTrue();
      const v0: string = sut.lg.description as string;
      hilog.info(DOMAIN, TAG, 'lg-description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: IconItem | undefined = sut.getValue('1');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "1", String(v1));
      expect(v1).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ01_7500
     * @tc.name: testBrkObj010075
     * @tc.desc: Anchor: IconItem slots must keep separate descriptions
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010075 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list1'), 'a'), new IconItem($r('app.media.list2'), 'b'), new IconItem($r('app.media.list3'), 'c'));
      const v0: string = sut.sm.description as string;
      hilog.info(DOMAIN, TAG, 'sm-description actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: string = sut.lg.description as string;
      hilog.info(DOMAIN, TAG, 'lg-description actual=%{public}s expected=%{public}s', String(v1), String("c"));
      expect(v1).assertEqual("c");
      hilog.info(DOMAIN, TAG, 'slots-not-shared actual=%{public}s expected=false', String(sut.sm.description === sut.lg.description));
      expect(sut.sm.description === sut.lg.description).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj010075 end');
    })

  })
}
