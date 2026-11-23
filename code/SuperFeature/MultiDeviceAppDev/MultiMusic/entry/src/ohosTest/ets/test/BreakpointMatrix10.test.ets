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

// @volume rule=getValue(k)-returns-field-k,other-keys-undefined basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
interface IBox {
  id: number;
  label: string;
  enabled: boolean;
}

export default function breakpointMatrix10Test() {
  describe('BreakpointMatrix10', () => {

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0100
     * @tc.name: testBrkObj030001
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030001 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 1, label: 'box-1', enabled: false }, { id: 501, label: 'box-501', enabled: false }, { id: 901, label: 'box-901', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(501));
      expect(v0).assertEqual(501);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0200
     * @tc.name: testBrkObj030002
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030002 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 2, label: 'box-2', enabled: true }, { id: 502, label: 'box-502', enabled: true }, { id: 902, label: 'box-902', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(902));
      expect(v0).assertEqual(902);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-502"));
      expect(v1).assertEqual("box-502");
      const v2: IBox | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0300
     * @tc.name: testBrkObj030003
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030003 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 3, label: 'box-3', enabled: false }, { id: 503, label: 'box-503', enabled: false }, { id: 903, label: 'box-903', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(503));
      expect(v0).assertEqual(503);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0400
     * @tc.name: testBrkObj030004
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030004 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 4, label: 'box-4', enabled: true }, { id: 504, label: 'box-504', enabled: true }, { id: 904, label: 'box-904', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(904));
      expect(v0).assertEqual(904);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-504"));
      expect(v1).assertEqual("box-504");
      const v2: IBox | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0500
     * @tc.name: testBrkObj030005
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030005 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 5, label: 'box-5', enabled: false }, { id: 505, label: 'box-505', enabled: false }, { id: 905, label: 'box-905', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(505));
      expect(v0).assertEqual(505);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0600
     * @tc.name: testBrkObj030006
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030006 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 6, label: 'box-6', enabled: true }, { id: 506, label: 'box-506', enabled: true }, { id: 906, label: 'box-906', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(906));
      expect(v0).assertEqual(906);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-506"));
      expect(v1).assertEqual("box-506");
      const v2: IBox | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0700
     * @tc.name: testBrkObj030007
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030007 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 7, label: 'box-7', enabled: false }, { id: 507, label: 'box-507', enabled: false }, { id: 907, label: 'box-907', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(507));
      expect(v0).assertEqual(507);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0800
     * @tc.name: testBrkObj030008
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030008 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 8, label: 'box-8', enabled: true }, { id: 508, label: 'box-508', enabled: true }, { id: 908, label: 'box-908', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(908));
      expect(v0).assertEqual(908);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-508"));
      expect(v1).assertEqual("box-508");
      const v2: IBox | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_0900
     * @tc.name: testBrkObj030009
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030009 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 9, label: 'box-9', enabled: false }, { id: 509, label: 'box-509', enabled: false }, { id: 909, label: 'box-909', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(509));
      expect(v0).assertEqual(509);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1000
     * @tc.name: testBrkObj030010
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030010 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 10, label: 'box-10', enabled: true }, { id: 510, label: 'box-510', enabled: true }, { id: 910, label: 'box-910', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(910));
      expect(v0).assertEqual(910);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-510"));
      expect(v1).assertEqual("box-510");
      const v2: IBox | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1100
     * @tc.name: testBrkObj030011
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030011 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 11, label: 'box-11', enabled: false }, { id: 511, label: 'box-511', enabled: false }, { id: 911, label: 'box-911', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(511));
      expect(v0).assertEqual(511);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1200
     * @tc.name: testBrkObj030012
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030012 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 12, label: 'box-12', enabled: true }, { id: 512, label: 'box-512', enabled: true }, { id: 912, label: 'box-912', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(912));
      expect(v0).assertEqual(912);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-512"));
      expect(v1).assertEqual("box-512");
      const v2: IBox | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1300
     * @tc.name: testBrkObj030013
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030013 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 13, label: 'box-13', enabled: false }, { id: 513, label: 'box-513', enabled: false }, { id: 913, label: 'box-913', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(513));
      expect(v0).assertEqual(513);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1400
     * @tc.name: testBrkObj030014
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030014 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 14, label: 'box-14', enabled: true }, { id: 514, label: 'box-514', enabled: true }, { id: 914, label: 'box-914', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(914));
      expect(v0).assertEqual(914);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-514"));
      expect(v1).assertEqual("box-514");
      const v2: IBox | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1500
     * @tc.name: testBrkObj030015
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030015 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 15, label: 'box-15', enabled: false }, { id: 515, label: 'box-515', enabled: false }, { id: 915, label: 'box-915', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(515));
      expect(v0).assertEqual(515);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1600
     * @tc.name: testBrkObj030016
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030016 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 16, label: 'box-16', enabled: true }, { id: 516, label: 'box-516', enabled: true }, { id: 916, label: 'box-916', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(916));
      expect(v0).assertEqual(916);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-516"));
      expect(v1).assertEqual("box-516");
      const v2: IBox | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1700
     * @tc.name: testBrkObj030017
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030017 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 17, label: 'box-17', enabled: false }, { id: 517, label: 'box-517', enabled: false }, { id: 917, label: 'box-917', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(517));
      expect(v0).assertEqual(517);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1800
     * @tc.name: testBrkObj030018
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030018 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 18, label: 'box-18', enabled: true }, { id: 518, label: 'box-518', enabled: true }, { id: 918, label: 'box-918', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(918));
      expect(v0).assertEqual(918);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-518"));
      expect(v1).assertEqual("box-518");
      const v2: IBox | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_1900
     * @tc.name: testBrkObj030019
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030019 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 19, label: 'box-19', enabled: false }, { id: 519, label: 'box-519', enabled: false }, { id: 919, label: 'box-919', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(519));
      expect(v0).assertEqual(519);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2000
     * @tc.name: testBrkObj030020
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030020 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 20, label: 'box-20', enabled: true }, { id: 520, label: 'box-520', enabled: true }, { id: 920, label: 'box-920', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(920));
      expect(v0).assertEqual(920);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-520"));
      expect(v1).assertEqual("box-520");
      const v2: IBox | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2100
     * @tc.name: testBrkObj030021
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030021 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 21, label: 'box-21', enabled: false }, { id: 521, label: 'box-521', enabled: false }, { id: 921, label: 'box-921', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(521));
      expect(v0).assertEqual(521);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2200
     * @tc.name: testBrkObj030022
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030022 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 22, label: 'box-22', enabled: true }, { id: 522, label: 'box-522', enabled: true }, { id: 922, label: 'box-922', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(922));
      expect(v0).assertEqual(922);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-522"));
      expect(v1).assertEqual("box-522");
      const v2: IBox | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2300
     * @tc.name: testBrkObj030023
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030023 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 23, label: 'box-23', enabled: false }, { id: 523, label: 'box-523', enabled: false }, { id: 923, label: 'box-923', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(523));
      expect(v0).assertEqual(523);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2400
     * @tc.name: testBrkObj030024
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030024 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 24, label: 'box-24', enabled: true }, { id: 524, label: 'box-524', enabled: true }, { id: 924, label: 'box-924', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(924));
      expect(v0).assertEqual(924);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-524"));
      expect(v1).assertEqual("box-524");
      const v2: IBox | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2500
     * @tc.name: testBrkObj030025
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030025 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 25, label: 'box-25', enabled: false }, { id: 525, label: 'box-525', enabled: false }, { id: 925, label: 'box-925', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(525));
      expect(v0).assertEqual(525);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2600
     * @tc.name: testBrkObj030026
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030026 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 26, label: 'box-26', enabled: true }, { id: 526, label: 'box-526', enabled: true }, { id: 926, label: 'box-926', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(926));
      expect(v0).assertEqual(926);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-526"));
      expect(v1).assertEqual("box-526");
      const v2: IBox | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2700
     * @tc.name: testBrkObj030027
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030027 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 27, label: 'box-27', enabled: false }, { id: 527, label: 'box-527', enabled: false }, { id: 927, label: 'box-927', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(527));
      expect(v0).assertEqual(527);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2800
     * @tc.name: testBrkObj030028
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030028 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 28, label: 'box-28', enabled: true }, { id: 528, label: 'box-528', enabled: true }, { id: 928, label: 'box-928', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(928));
      expect(v0).assertEqual(928);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-528"));
      expect(v1).assertEqual("box-528");
      const v2: IBox | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_2900
     * @tc.name: testBrkObj030029
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030029 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 29, label: 'box-29', enabled: false }, { id: 529, label: 'box-529', enabled: false }, { id: 929, label: 'box-929', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(529));
      expect(v0).assertEqual(529);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3000
     * @tc.name: testBrkObj030030
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030030 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 30, label: 'box-30', enabled: true }, { id: 530, label: 'box-530', enabled: true }, { id: 930, label: 'box-930', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(930));
      expect(v0).assertEqual(930);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-530"));
      expect(v1).assertEqual("box-530");
      const v2: IBox | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3100
     * @tc.name: testBrkObj030031
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030031 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 31, label: 'box-31', enabled: false }, { id: 531, label: 'box-531', enabled: false }, { id: 931, label: 'box-931', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(531));
      expect(v0).assertEqual(531);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3200
     * @tc.name: testBrkObj030032
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030032 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 32, label: 'box-32', enabled: true }, { id: 532, label: 'box-532', enabled: true }, { id: 932, label: 'box-932', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(932));
      expect(v0).assertEqual(932);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-532"));
      expect(v1).assertEqual("box-532");
      const v2: IBox | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3300
     * @tc.name: testBrkObj030033
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030033 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 33, label: 'box-33', enabled: false }, { id: 533, label: 'box-533', enabled: false }, { id: 933, label: 'box-933', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(533));
      expect(v0).assertEqual(533);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3400
     * @tc.name: testBrkObj030034
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030034 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 34, label: 'box-34', enabled: true }, { id: 534, label: 'box-534', enabled: true }, { id: 934, label: 'box-934', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(934));
      expect(v0).assertEqual(934);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-534"));
      expect(v1).assertEqual("box-534");
      const v2: IBox | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3500
     * @tc.name: testBrkObj030035
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030035 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 35, label: 'box-35', enabled: false }, { id: 535, label: 'box-535', enabled: false }, { id: 935, label: 'box-935', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(535));
      expect(v0).assertEqual(535);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3600
     * @tc.name: testBrkObj030036
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030036 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 36, label: 'box-36', enabled: true }, { id: 536, label: 'box-536', enabled: true }, { id: 936, label: 'box-936', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(936));
      expect(v0).assertEqual(936);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-536"));
      expect(v1).assertEqual("box-536");
      const v2: IBox | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3700
     * @tc.name: testBrkObj030037
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030037 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 37, label: 'box-37', enabled: false }, { id: 537, label: 'box-537', enabled: false }, { id: 937, label: 'box-937', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(537));
      expect(v0).assertEqual(537);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3800
     * @tc.name: testBrkObj030038
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030038 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 38, label: 'box-38', enabled: true }, { id: 538, label: 'box-538', enabled: true }, { id: 938, label: 'box-938', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(938));
      expect(v0).assertEqual(938);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-538"));
      expect(v1).assertEqual("box-538");
      const v2: IBox | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_3900
     * @tc.name: testBrkObj030039
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030039 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 39, label: 'box-39', enabled: false }, { id: 539, label: 'box-539', enabled: false }, { id: 939, label: 'box-939', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(539));
      expect(v0).assertEqual(539);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4000
     * @tc.name: testBrkObj030040
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030040 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 40, label: 'box-40', enabled: true }, { id: 540, label: 'box-540', enabled: true }, { id: 940, label: 'box-940', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(940));
      expect(v0).assertEqual(940);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-540"));
      expect(v1).assertEqual("box-540");
      const v2: IBox | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4100
     * @tc.name: testBrkObj030041
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030041 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 41, label: 'box-41', enabled: false }, { id: 541, label: 'box-541', enabled: false }, { id: 941, label: 'box-941', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(541));
      expect(v0).assertEqual(541);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4200
     * @tc.name: testBrkObj030042
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030042 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 42, label: 'box-42', enabled: true }, { id: 542, label: 'box-542', enabled: true }, { id: 942, label: 'box-942', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(942));
      expect(v0).assertEqual(942);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-542"));
      expect(v1).assertEqual("box-542");
      const v2: IBox | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4300
     * @tc.name: testBrkObj030043
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030043 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 43, label: 'box-43', enabled: false }, { id: 543, label: 'box-543', enabled: false }, { id: 943, label: 'box-943', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(543));
      expect(v0).assertEqual(543);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4400
     * @tc.name: testBrkObj030044
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030044 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 44, label: 'box-44', enabled: true }, { id: 544, label: 'box-544', enabled: true }, { id: 944, label: 'box-944', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(944));
      expect(v0).assertEqual(944);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-544"));
      expect(v1).assertEqual("box-544");
      const v2: IBox | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4500
     * @tc.name: testBrkObj030045
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030045 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 45, label: 'box-45', enabled: false }, { id: 545, label: 'box-545', enabled: false }, { id: 945, label: 'box-945', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(545));
      expect(v0).assertEqual(545);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4600
     * @tc.name: testBrkObj030046
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030046 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 46, label: 'box-46', enabled: true }, { id: 546, label: 'box-546', enabled: true }, { id: 946, label: 'box-946', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(946));
      expect(v0).assertEqual(946);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-546"));
      expect(v1).assertEqual("box-546");
      const v2: IBox | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4700
     * @tc.name: testBrkObj030047
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030047 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 47, label: 'box-47', enabled: false }, { id: 547, label: 'box-547', enabled: false }, { id: 947, label: 'box-947', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(547));
      expect(v0).assertEqual(547);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4800
     * @tc.name: testBrkObj030048
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030048 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 48, label: 'box-48', enabled: true }, { id: 548, label: 'box-548', enabled: true }, { id: 948, label: 'box-948', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(948));
      expect(v0).assertEqual(948);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-548"));
      expect(v1).assertEqual("box-548");
      const v2: IBox | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_4900
     * @tc.name: testBrkObj030049
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030049 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 49, label: 'box-49', enabled: false }, { id: 549, label: 'box-549', enabled: false }, { id: 949, label: 'box-949', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(549));
      expect(v0).assertEqual(549);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5000
     * @tc.name: testBrkObj030050
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030050 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 50, label: 'box-50', enabled: true }, { id: 550, label: 'box-550', enabled: true }, { id: 950, label: 'box-950', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(950));
      expect(v0).assertEqual(950);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-550"));
      expect(v1).assertEqual("box-550");
      const v2: IBox | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5100
     * @tc.name: testBrkObj030051
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030051 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 51, label: 'box-51', enabled: false }, { id: 551, label: 'box-551', enabled: false }, { id: 951, label: 'box-951', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(551));
      expect(v0).assertEqual(551);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5200
     * @tc.name: testBrkObj030052
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030052 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 52, label: 'box-52', enabled: true }, { id: 552, label: 'box-552', enabled: true }, { id: 952, label: 'box-952', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(952));
      expect(v0).assertEqual(952);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-552"));
      expect(v1).assertEqual("box-552");
      const v2: IBox | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5300
     * @tc.name: testBrkObj030053
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030053 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 53, label: 'box-53', enabled: false }, { id: 553, label: 'box-553', enabled: false }, { id: 953, label: 'box-953', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(553));
      expect(v0).assertEqual(553);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5400
     * @tc.name: testBrkObj030054
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030054 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 54, label: 'box-54', enabled: true }, { id: 554, label: 'box-554', enabled: true }, { id: 954, label: 'box-954', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(954));
      expect(v0).assertEqual(954);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-554"));
      expect(v1).assertEqual("box-554");
      const v2: IBox | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5500
     * @tc.name: testBrkObj030055
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030055 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 55, label: 'box-55', enabled: false }, { id: 555, label: 'box-555', enabled: false }, { id: 955, label: 'box-955', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(555));
      expect(v0).assertEqual(555);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5600
     * @tc.name: testBrkObj030056
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030056 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 56, label: 'box-56', enabled: true }, { id: 556, label: 'box-556', enabled: true }, { id: 956, label: 'box-956', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(956));
      expect(v0).assertEqual(956);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-556"));
      expect(v1).assertEqual("box-556");
      const v2: IBox | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5700
     * @tc.name: testBrkObj030057
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030057 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 57, label: 'box-57', enabled: false }, { id: 557, label: 'box-557', enabled: false }, { id: 957, label: 'box-957', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(557));
      expect(v0).assertEqual(557);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5800
     * @tc.name: testBrkObj030058
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030058 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 58, label: 'box-58', enabled: true }, { id: 558, label: 'box-558', enabled: true }, { id: 958, label: 'box-958', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(958));
      expect(v0).assertEqual(958);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-558"));
      expect(v1).assertEqual("box-558");
      const v2: IBox | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_5900
     * @tc.name: testBrkObj030059
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030059 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 59, label: 'box-59', enabled: false }, { id: 559, label: 'box-559', enabled: false }, { id: 959, label: 'box-959', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(559));
      expect(v0).assertEqual(559);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6000
     * @tc.name: testBrkObj030060
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030060 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 60, label: 'box-60', enabled: true }, { id: 560, label: 'box-560', enabled: true }, { id: 960, label: 'box-960', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(960));
      expect(v0).assertEqual(960);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-560"));
      expect(v1).assertEqual("box-560");
      const v2: IBox | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6100
     * @tc.name: testBrkObj030061
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030061 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 61, label: 'box-61', enabled: false }, { id: 561, label: 'box-561', enabled: false }, { id: 961, label: 'box-961', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(561));
      expect(v0).assertEqual(561);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6200
     * @tc.name: testBrkObj030062
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030062 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 62, label: 'box-62', enabled: true }, { id: 562, label: 'box-562', enabled: true }, { id: 962, label: 'box-962', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(962));
      expect(v0).assertEqual(962);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-562"));
      expect(v1).assertEqual("box-562");
      const v2: IBox | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6300
     * @tc.name: testBrkObj030063
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030063 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 63, label: 'box-63', enabled: false }, { id: 563, label: 'box-563', enabled: false }, { id: 963, label: 'box-963', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(563));
      expect(v0).assertEqual(563);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6400
     * @tc.name: testBrkObj030064
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030064 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 64, label: 'box-64', enabled: true }, { id: 564, label: 'box-564', enabled: true }, { id: 964, label: 'box-964', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(964));
      expect(v0).assertEqual(964);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-564"));
      expect(v1).assertEqual("box-564");
      const v2: IBox | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6500
     * @tc.name: testBrkObj030065
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030065 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 65, label: 'box-65', enabled: false }, { id: 565, label: 'box-565', enabled: false }, { id: 965, label: 'box-965', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(565));
      expect(v0).assertEqual(565);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6600
     * @tc.name: testBrkObj030066
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030066 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 66, label: 'box-66', enabled: true }, { id: 566, label: 'box-566', enabled: true }, { id: 966, label: 'box-966', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(966));
      expect(v0).assertEqual(966);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-566"));
      expect(v1).assertEqual("box-566");
      const v2: IBox | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6700
     * @tc.name: testBrkObj030067
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030067 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 67, label: 'box-67', enabled: false }, { id: 567, label: 'box-567', enabled: false }, { id: 967, label: 'box-967', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(567));
      expect(v0).assertEqual(567);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6800
     * @tc.name: testBrkObj030068
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030068 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 68, label: 'box-68', enabled: true }, { id: 568, label: 'box-568', enabled: true }, { id: 968, label: 'box-968', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(968));
      expect(v0).assertEqual(968);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-568"));
      expect(v1).assertEqual("box-568");
      const v2: IBox | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_6900
     * @tc.name: testBrkObj030069
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030069 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 69, label: 'box-69', enabled: false }, { id: 569, label: 'box-569', enabled: false }, { id: 969, label: 'box-969', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(569));
      expect(v0).assertEqual(569);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7000
     * @tc.name: testBrkObj030070
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030070 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 70, label: 'box-70', enabled: true }, { id: 570, label: 'box-570', enabled: true }, { id: 970, label: 'box-970', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(970));
      expect(v0).assertEqual(970);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-570"));
      expect(v1).assertEqual("box-570");
      const v2: IBox | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7100
     * @tc.name: testBrkObj030071
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030071 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 71, label: 'box-71', enabled: false }, { id: 571, label: 'box-571', enabled: false }, { id: 971, label: 'box-971', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(571));
      expect(v0).assertEqual(571);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7200
     * @tc.name: testBrkObj030072
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030072 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 72, label: 'box-72', enabled: true }, { id: 572, label: 'box-572', enabled: true }, { id: 972, label: 'box-972', enabled: true });
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg.id actual=%{public}s expected=%{public}s', String(v0), String(972));
      expect(v0).assertEqual(972);
      const v1: string = sut.md.label;
      hilog.info(DOMAIN, TAG, 'md.label actual=%{public}s expected=%{public}s', String(v1), String("box-572"));
      expect(v1).assertEqual("box-572");
      const v2: IBox | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7300
     * @tc.name: testBrkObj030073
     * @tc.desc: Verify interface typed value keeps identity and fields per breakpoint key (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj030073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030073 begin');
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>({ id: 73, label: 'box-73', enabled: false }, { id: 573, label: 'box-573', enabled: false }, { id: 973, label: 'box-973', enabled: false });
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.id;
      hilog.info(DOMAIN, TAG, 'md.id actual=%{public}s expected=%{public}s', String(v0), String(573));
      expect(v0).assertEqual(573);
      const v1: boolean = sut.sm.enabled;
      hilog.info(DOMAIN, TAG, 'sm.enabled actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: IBox | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7400
     * @tc.name: testBrkObj030074
     * @tc.desc: Anchor: interface value with disabled flag must keep boolean false
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj030074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030074 begin');
      let disabled: IBox = { id: 7, label: 'disabled', enabled: false };
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>(disabled, disabled, disabled);
      const v0: boolean = sut.lg.enabled;
      hilog.info(DOMAIN, TAG, 'lg-enabled actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg-id actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: IBox | undefined = sut.getValue('l');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "l", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ03_7500
     * @tc.name: testBrkObj030075
     * @tc.desc: Anchor: two interface slots must hold different identifiers
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj030075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030075 begin');
      let low: IBox = { id: 1, label: 'low', enabled: false };
      let high: IBox = { id: 2, label: 'high', enabled: true };
      let sut: BreakpointType<IBox> = new BreakpointType<IBox>(low, low, high);
      const v0: number = sut.lg.id;
      hilog.info(DOMAIN, TAG, 'lg-id actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = sut.sm.id;
      hilog.info(DOMAIN, TAG, 'sm-id actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'slots-distinct actual=%{public}s expected=false', String(sut.sm === sut.lg));
      expect(sut.sm === sut.lg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj030075 end');
    })

  })
}
