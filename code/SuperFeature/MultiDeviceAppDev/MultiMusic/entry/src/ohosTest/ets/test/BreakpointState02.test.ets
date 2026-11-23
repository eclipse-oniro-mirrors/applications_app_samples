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

// @volume rule=mutating-instance-A-never-changes-instance-B basis=state-derivation cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointState02Test() {
  describe('BreakpointState02', () => {

    /**
     * @tc.number: SUB_MM_BRKISO01_0100
     * @tc.name: testBrkIso010001
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010001 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-1', 'a-md-1', 'a-lg-1');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-1', 'b-md-1', 'b-lg-1');
      sutA.lg = 'mut-' + 1;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-1"));
      expect(v0).assertEqual("mut-1");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-1"));
      expect(v1).assertEqual("b-lg-1");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0200
     * @tc.name: testBrkIso010002
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010002 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-2', 'a-md-2', 'a-lg-2');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-2', 'b-md-2', 'b-lg-2');
      sutA.lg = 'mut-' + 2;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-2"));
      expect(v0).assertEqual("mut-2");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-2"));
      expect(v1).assertEqual("b-lg-2");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0300
     * @tc.name: testBrkIso010003
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010003 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-3', 'a-md-3', 'a-lg-3');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-3', 'b-md-3', 'b-lg-3');
      sutA.lg = 'mut-' + 3;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-3"));
      expect(v0).assertEqual("mut-3");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-3"));
      expect(v1).assertEqual("b-lg-3");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0400
     * @tc.name: testBrkIso010004
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010004 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-4', 'a-md-4', 'a-lg-4');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-4', 'b-md-4', 'b-lg-4');
      sutA.lg = 'mut-' + 4;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-4"));
      expect(v0).assertEqual("mut-4");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-4"));
      expect(v1).assertEqual("b-lg-4");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0500
     * @tc.name: testBrkIso010005
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010005 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-5', 'a-md-5', 'a-lg-5');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-5', 'b-md-5', 'b-lg-5');
      sutA.lg = 'mut-' + 5;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-5"));
      expect(v0).assertEqual("mut-5");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-5"));
      expect(v1).assertEqual("b-lg-5");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0600
     * @tc.name: testBrkIso010006
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010006 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-6', 'a-md-6', 'a-lg-6');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-6', 'b-md-6', 'b-lg-6');
      sutA.lg = 'mut-' + 6;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-6"));
      expect(v0).assertEqual("mut-6");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-6"));
      expect(v1).assertEqual("b-lg-6");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0700
     * @tc.name: testBrkIso010007
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010007 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-7', 'a-md-7', 'a-lg-7');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-7', 'b-md-7', 'b-lg-7');
      sutA.lg = 'mut-' + 7;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-7"));
      expect(v0).assertEqual("mut-7");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-7"));
      expect(v1).assertEqual("b-lg-7");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0800
     * @tc.name: testBrkIso010008
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010008 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-8', 'a-md-8', 'a-lg-8');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-8', 'b-md-8', 'b-lg-8');
      sutA.lg = 'mut-' + 8;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-8"));
      expect(v0).assertEqual("mut-8");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-8"));
      expect(v1).assertEqual("b-lg-8");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_0900
     * @tc.name: testBrkIso010009
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010009 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-9', 'a-md-9', 'a-lg-9');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-9', 'b-md-9', 'b-lg-9');
      sutA.lg = 'mut-' + 9;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-9"));
      expect(v0).assertEqual("mut-9");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-9"));
      expect(v1).assertEqual("b-lg-9");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1000
     * @tc.name: testBrkIso010010
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010010 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-10', 'a-md-10', 'a-lg-10');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-10', 'b-md-10', 'b-lg-10');
      sutA.lg = 'mut-' + 10;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-10"));
      expect(v0).assertEqual("mut-10");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-10"));
      expect(v1).assertEqual("b-lg-10");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1100
     * @tc.name: testBrkIso010011
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010011 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-11', 'a-md-11', 'a-lg-11');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-11', 'b-md-11', 'b-lg-11');
      sutA.lg = 'mut-' + 11;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-11"));
      expect(v0).assertEqual("mut-11");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-11"));
      expect(v1).assertEqual("b-lg-11");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1200
     * @tc.name: testBrkIso010012
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010012 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-12', 'a-md-12', 'a-lg-12');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-12', 'b-md-12', 'b-lg-12');
      sutA.lg = 'mut-' + 12;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-12"));
      expect(v0).assertEqual("mut-12");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-12"));
      expect(v1).assertEqual("b-lg-12");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1300
     * @tc.name: testBrkIso010013
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010013 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-13', 'a-md-13', 'a-lg-13');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-13', 'b-md-13', 'b-lg-13');
      sutA.lg = 'mut-' + 13;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-13"));
      expect(v0).assertEqual("mut-13");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-13"));
      expect(v1).assertEqual("b-lg-13");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1400
     * @tc.name: testBrkIso010014
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010014 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-14', 'a-md-14', 'a-lg-14');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-14', 'b-md-14', 'b-lg-14');
      sutA.lg = 'mut-' + 14;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-14"));
      expect(v0).assertEqual("mut-14");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-14"));
      expect(v1).assertEqual("b-lg-14");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1500
     * @tc.name: testBrkIso010015
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010015 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-15', 'a-md-15', 'a-lg-15');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-15', 'b-md-15', 'b-lg-15');
      sutA.lg = 'mut-' + 15;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-15"));
      expect(v0).assertEqual("mut-15");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-15"));
      expect(v1).assertEqual("b-lg-15");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1600
     * @tc.name: testBrkIso010016
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010016 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-16', 'a-md-16', 'a-lg-16');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-16', 'b-md-16', 'b-lg-16');
      sutA.lg = 'mut-' + 16;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-16"));
      expect(v0).assertEqual("mut-16");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-16"));
      expect(v1).assertEqual("b-lg-16");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1700
     * @tc.name: testBrkIso010017
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010017 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-17', 'a-md-17', 'a-lg-17');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-17', 'b-md-17', 'b-lg-17');
      sutA.lg = 'mut-' + 17;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-17"));
      expect(v0).assertEqual("mut-17");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-17"));
      expect(v1).assertEqual("b-lg-17");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1800
     * @tc.name: testBrkIso010018
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010018 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-18', 'a-md-18', 'a-lg-18');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-18', 'b-md-18', 'b-lg-18');
      sutA.lg = 'mut-' + 18;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-18"));
      expect(v0).assertEqual("mut-18");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-18"));
      expect(v1).assertEqual("b-lg-18");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_1900
     * @tc.name: testBrkIso010019
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010019 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-19', 'a-md-19', 'a-lg-19');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-19', 'b-md-19', 'b-lg-19');
      sutA.lg = 'mut-' + 19;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-19"));
      expect(v0).assertEqual("mut-19");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-19"));
      expect(v1).assertEqual("b-lg-19");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2000
     * @tc.name: testBrkIso010020
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010020 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-20', 'a-md-20', 'a-lg-20');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-20', 'b-md-20', 'b-lg-20');
      sutA.lg = 'mut-' + 20;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-20"));
      expect(v0).assertEqual("mut-20");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-20"));
      expect(v1).assertEqual("b-lg-20");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2100
     * @tc.name: testBrkIso010021
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010021 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-21', 'a-md-21', 'a-lg-21');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-21', 'b-md-21', 'b-lg-21');
      sutA.lg = 'mut-' + 21;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-21"));
      expect(v0).assertEqual("mut-21");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-21"));
      expect(v1).assertEqual("b-lg-21");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2200
     * @tc.name: testBrkIso010022
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010022 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-22', 'a-md-22', 'a-lg-22');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-22', 'b-md-22', 'b-lg-22');
      sutA.lg = 'mut-' + 22;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-22"));
      expect(v0).assertEqual("mut-22");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-22"));
      expect(v1).assertEqual("b-lg-22");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2300
     * @tc.name: testBrkIso010023
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010023 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-23', 'a-md-23', 'a-lg-23');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-23', 'b-md-23', 'b-lg-23');
      sutA.lg = 'mut-' + 23;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-23"));
      expect(v0).assertEqual("mut-23");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-23"));
      expect(v1).assertEqual("b-lg-23");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2400
     * @tc.name: testBrkIso010024
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010024 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-24', 'a-md-24', 'a-lg-24');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-24', 'b-md-24', 'b-lg-24');
      sutA.lg = 'mut-' + 24;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-24"));
      expect(v0).assertEqual("mut-24");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-24"));
      expect(v1).assertEqual("b-lg-24");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2500
     * @tc.name: testBrkIso010025
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010025 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-25', 'a-md-25', 'a-lg-25');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-25', 'b-md-25', 'b-lg-25');
      sutA.lg = 'mut-' + 25;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-25"));
      expect(v0).assertEqual("mut-25");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-25"));
      expect(v1).assertEqual("b-lg-25");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2600
     * @tc.name: testBrkIso010026
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010026 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-26', 'a-md-26', 'a-lg-26');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-26', 'b-md-26', 'b-lg-26');
      sutA.lg = 'mut-' + 26;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-26"));
      expect(v0).assertEqual("mut-26");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-26"));
      expect(v1).assertEqual("b-lg-26");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2700
     * @tc.name: testBrkIso010027
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010027 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-27', 'a-md-27', 'a-lg-27');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-27', 'b-md-27', 'b-lg-27');
      sutA.lg = 'mut-' + 27;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-27"));
      expect(v0).assertEqual("mut-27");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-27"));
      expect(v1).assertEqual("b-lg-27");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2800
     * @tc.name: testBrkIso010028
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010028 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-28', 'a-md-28', 'a-lg-28');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-28', 'b-md-28', 'b-lg-28');
      sutA.lg = 'mut-' + 28;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-28"));
      expect(v0).assertEqual("mut-28");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-28"));
      expect(v1).assertEqual("b-lg-28");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_2900
     * @tc.name: testBrkIso010029
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010029 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-29', 'a-md-29', 'a-lg-29');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-29', 'b-md-29', 'b-lg-29');
      sutA.lg = 'mut-' + 29;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-29"));
      expect(v0).assertEqual("mut-29");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-29"));
      expect(v1).assertEqual("b-lg-29");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3000
     * @tc.name: testBrkIso010030
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010030 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-30', 'a-md-30', 'a-lg-30');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-30', 'b-md-30', 'b-lg-30');
      sutA.lg = 'mut-' + 30;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-30"));
      expect(v0).assertEqual("mut-30");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-30"));
      expect(v1).assertEqual("b-lg-30");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3100
     * @tc.name: testBrkIso010031
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010031 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-31', 'a-md-31', 'a-lg-31');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-31', 'b-md-31', 'b-lg-31');
      sutA.lg = 'mut-' + 31;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-31"));
      expect(v0).assertEqual("mut-31");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-31"));
      expect(v1).assertEqual("b-lg-31");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3200
     * @tc.name: testBrkIso010032
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010032 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-32', 'a-md-32', 'a-lg-32');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-32', 'b-md-32', 'b-lg-32');
      sutA.lg = 'mut-' + 32;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-32"));
      expect(v0).assertEqual("mut-32");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-32"));
      expect(v1).assertEqual("b-lg-32");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3300
     * @tc.name: testBrkIso010033
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010033 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-33', 'a-md-33', 'a-lg-33');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-33', 'b-md-33', 'b-lg-33');
      sutA.lg = 'mut-' + 33;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-33"));
      expect(v0).assertEqual("mut-33");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-33"));
      expect(v1).assertEqual("b-lg-33");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3400
     * @tc.name: testBrkIso010034
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010034 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-34', 'a-md-34', 'a-lg-34');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-34', 'b-md-34', 'b-lg-34');
      sutA.lg = 'mut-' + 34;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-34"));
      expect(v0).assertEqual("mut-34");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-34"));
      expect(v1).assertEqual("b-lg-34");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3500
     * @tc.name: testBrkIso010035
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010035 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-35', 'a-md-35', 'a-lg-35');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-35', 'b-md-35', 'b-lg-35');
      sutA.lg = 'mut-' + 35;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-35"));
      expect(v0).assertEqual("mut-35");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-35"));
      expect(v1).assertEqual("b-lg-35");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3600
     * @tc.name: testBrkIso010036
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010036 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-36', 'a-md-36', 'a-lg-36');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-36', 'b-md-36', 'b-lg-36');
      sutA.lg = 'mut-' + 36;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-36"));
      expect(v0).assertEqual("mut-36");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-36"));
      expect(v1).assertEqual("b-lg-36");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3700
     * @tc.name: testBrkIso010037
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010037 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-37', 'a-md-37', 'a-lg-37');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-37', 'b-md-37', 'b-lg-37');
      sutA.lg = 'mut-' + 37;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-37"));
      expect(v0).assertEqual("mut-37");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-37"));
      expect(v1).assertEqual("b-lg-37");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3800
     * @tc.name: testBrkIso010038
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010038 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-38', 'a-md-38', 'a-lg-38');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-38', 'b-md-38', 'b-lg-38');
      sutA.lg = 'mut-' + 38;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-38"));
      expect(v0).assertEqual("mut-38");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-38"));
      expect(v1).assertEqual("b-lg-38");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_3900
     * @tc.name: testBrkIso010039
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010039 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-39', 'a-md-39', 'a-lg-39');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-39', 'b-md-39', 'b-lg-39');
      sutA.lg = 'mut-' + 39;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-39"));
      expect(v0).assertEqual("mut-39");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-39"));
      expect(v1).assertEqual("b-lg-39");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4000
     * @tc.name: testBrkIso010040
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010040 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-40', 'a-md-40', 'a-lg-40');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-40', 'b-md-40', 'b-lg-40');
      sutA.lg = 'mut-' + 40;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-40"));
      expect(v0).assertEqual("mut-40");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-40"));
      expect(v1).assertEqual("b-lg-40");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4100
     * @tc.name: testBrkIso010041
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010041 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-41', 'a-md-41', 'a-lg-41');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-41', 'b-md-41', 'b-lg-41');
      sutA.lg = 'mut-' + 41;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-41"));
      expect(v0).assertEqual("mut-41");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-41"));
      expect(v1).assertEqual("b-lg-41");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4200
     * @tc.name: testBrkIso010042
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010042 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-42', 'a-md-42', 'a-lg-42');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-42', 'b-md-42', 'b-lg-42');
      sutA.lg = 'mut-' + 42;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-42"));
      expect(v0).assertEqual("mut-42");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-42"));
      expect(v1).assertEqual("b-lg-42");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4300
     * @tc.name: testBrkIso010043
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010043 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-43', 'a-md-43', 'a-lg-43');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-43', 'b-md-43', 'b-lg-43');
      sutA.lg = 'mut-' + 43;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-43"));
      expect(v0).assertEqual("mut-43");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-43"));
      expect(v1).assertEqual("b-lg-43");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4400
     * @tc.name: testBrkIso010044
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010044 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-44', 'a-md-44', 'a-lg-44');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-44', 'b-md-44', 'b-lg-44');
      sutA.lg = 'mut-' + 44;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-44"));
      expect(v0).assertEqual("mut-44");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-44"));
      expect(v1).assertEqual("b-lg-44");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4500
     * @tc.name: testBrkIso010045
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010045 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-45', 'a-md-45', 'a-lg-45');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-45', 'b-md-45', 'b-lg-45');
      sutA.lg = 'mut-' + 45;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-45"));
      expect(v0).assertEqual("mut-45");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-45"));
      expect(v1).assertEqual("b-lg-45");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4600
     * @tc.name: testBrkIso010046
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010046 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-46', 'a-md-46', 'a-lg-46');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-46', 'b-md-46', 'b-lg-46');
      sutA.lg = 'mut-' + 46;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-46"));
      expect(v0).assertEqual("mut-46");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-46"));
      expect(v1).assertEqual("b-lg-46");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4700
     * @tc.name: testBrkIso010047
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010047 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-47', 'a-md-47', 'a-lg-47');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-47', 'b-md-47', 'b-lg-47');
      sutA.lg = 'mut-' + 47;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-47"));
      expect(v0).assertEqual("mut-47");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-47"));
      expect(v1).assertEqual("b-lg-47");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4800
     * @tc.name: testBrkIso010048
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010048 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-48', 'a-md-48', 'a-lg-48');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-48', 'b-md-48', 'b-lg-48');
      sutA.lg = 'mut-' + 48;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-48"));
      expect(v0).assertEqual("mut-48");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-48"));
      expect(v1).assertEqual("b-lg-48");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_4900
     * @tc.name: testBrkIso010049
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010049 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-49', 'a-md-49', 'a-lg-49');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-49', 'b-md-49', 'b-lg-49');
      sutA.lg = 'mut-' + 49;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-49"));
      expect(v0).assertEqual("mut-49");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-49"));
      expect(v1).assertEqual("b-lg-49");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5000
     * @tc.name: testBrkIso010050
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010050 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-50', 'a-md-50', 'a-lg-50');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-50', 'b-md-50', 'b-lg-50');
      sutA.lg = 'mut-' + 50;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-50"));
      expect(v0).assertEqual("mut-50");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-50"));
      expect(v1).assertEqual("b-lg-50");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5100
     * @tc.name: testBrkIso010051
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010051 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-51', 'a-md-51', 'a-lg-51');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-51', 'b-md-51', 'b-lg-51');
      sutA.lg = 'mut-' + 51;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-51"));
      expect(v0).assertEqual("mut-51");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-51"));
      expect(v1).assertEqual("b-lg-51");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5200
     * @tc.name: testBrkIso010052
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010052 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-52', 'a-md-52', 'a-lg-52');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-52', 'b-md-52', 'b-lg-52');
      sutA.lg = 'mut-' + 52;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-52"));
      expect(v0).assertEqual("mut-52");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-52"));
      expect(v1).assertEqual("b-lg-52");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5300
     * @tc.name: testBrkIso010053
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010053 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-53', 'a-md-53', 'a-lg-53');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-53', 'b-md-53', 'b-lg-53');
      sutA.lg = 'mut-' + 53;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-53"));
      expect(v0).assertEqual("mut-53");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-53"));
      expect(v1).assertEqual("b-lg-53");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5400
     * @tc.name: testBrkIso010054
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010054 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-54', 'a-md-54', 'a-lg-54');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-54', 'b-md-54', 'b-lg-54');
      sutA.lg = 'mut-' + 54;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-54"));
      expect(v0).assertEqual("mut-54");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-54"));
      expect(v1).assertEqual("b-lg-54");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5500
     * @tc.name: testBrkIso010055
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010055 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-55', 'a-md-55', 'a-lg-55');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-55', 'b-md-55', 'b-lg-55');
      sutA.lg = 'mut-' + 55;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-55"));
      expect(v0).assertEqual("mut-55");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-55"));
      expect(v1).assertEqual("b-lg-55");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5600
     * @tc.name: testBrkIso010056
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010056 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-56', 'a-md-56', 'a-lg-56');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-56', 'b-md-56', 'b-lg-56');
      sutA.lg = 'mut-' + 56;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-56"));
      expect(v0).assertEqual("mut-56");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-56"));
      expect(v1).assertEqual("b-lg-56");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5700
     * @tc.name: testBrkIso010057
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010057 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-57', 'a-md-57', 'a-lg-57');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-57', 'b-md-57', 'b-lg-57');
      sutA.lg = 'mut-' + 57;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-57"));
      expect(v0).assertEqual("mut-57");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-57"));
      expect(v1).assertEqual("b-lg-57");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5800
     * @tc.name: testBrkIso010058
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010058 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-58', 'a-md-58', 'a-lg-58');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-58', 'b-md-58', 'b-lg-58');
      sutA.lg = 'mut-' + 58;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-58"));
      expect(v0).assertEqual("mut-58");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-58"));
      expect(v1).assertEqual("b-lg-58");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_5900
     * @tc.name: testBrkIso010059
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010059 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-59', 'a-md-59', 'a-lg-59');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-59', 'b-md-59', 'b-lg-59');
      sutA.lg = 'mut-' + 59;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-59"));
      expect(v0).assertEqual("mut-59");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-59"));
      expect(v1).assertEqual("b-lg-59");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6000
     * @tc.name: testBrkIso010060
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010060 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-60', 'a-md-60', 'a-lg-60');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-60', 'b-md-60', 'b-lg-60');
      sutA.lg = 'mut-' + 60;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-60"));
      expect(v0).assertEqual("mut-60");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-60"));
      expect(v1).assertEqual("b-lg-60");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6100
     * @tc.name: testBrkIso010061
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010061 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-61', 'a-md-61', 'a-lg-61');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-61', 'b-md-61', 'b-lg-61');
      sutA.lg = 'mut-' + 61;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-61"));
      expect(v0).assertEqual("mut-61");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-61"));
      expect(v1).assertEqual("b-lg-61");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6200
     * @tc.name: testBrkIso010062
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010062 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-62', 'a-md-62', 'a-lg-62');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-62', 'b-md-62', 'b-lg-62');
      sutA.lg = 'mut-' + 62;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-62"));
      expect(v0).assertEqual("mut-62");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-62"));
      expect(v1).assertEqual("b-lg-62");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6300
     * @tc.name: testBrkIso010063
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010063 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-63', 'a-md-63', 'a-lg-63');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-63', 'b-md-63', 'b-lg-63');
      sutA.lg = 'mut-' + 63;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-63"));
      expect(v0).assertEqual("mut-63");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-63"));
      expect(v1).assertEqual("b-lg-63");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6400
     * @tc.name: testBrkIso010064
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010064 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-64', 'a-md-64', 'a-lg-64');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-64', 'b-md-64', 'b-lg-64');
      sutA.lg = 'mut-' + 64;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-64"));
      expect(v0).assertEqual("mut-64");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-64"));
      expect(v1).assertEqual("b-lg-64");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6500
     * @tc.name: testBrkIso010065
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010065 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-65', 'a-md-65', 'a-lg-65');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-65', 'b-md-65', 'b-lg-65');
      sutA.lg = 'mut-' + 65;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-65"));
      expect(v0).assertEqual("mut-65");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-65"));
      expect(v1).assertEqual("b-lg-65");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6600
     * @tc.name: testBrkIso010066
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010066 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-66', 'a-md-66', 'a-lg-66');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-66', 'b-md-66', 'b-lg-66');
      sutA.lg = 'mut-' + 66;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-66"));
      expect(v0).assertEqual("mut-66");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-66"));
      expect(v1).assertEqual("b-lg-66");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6700
     * @tc.name: testBrkIso010067
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010067 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-67', 'a-md-67', 'a-lg-67');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-67', 'b-md-67', 'b-lg-67');
      sutA.lg = 'mut-' + 67;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-67"));
      expect(v0).assertEqual("mut-67");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-67"));
      expect(v1).assertEqual("b-lg-67");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6800
     * @tc.name: testBrkIso010068
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010068 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-68', 'a-md-68', 'a-lg-68');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-68', 'b-md-68', 'b-lg-68');
      sutA.lg = 'mut-' + 68;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-68"));
      expect(v0).assertEqual("mut-68");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-68"));
      expect(v1).assertEqual("b-lg-68");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_6900
     * @tc.name: testBrkIso010069
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010069 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-69', 'a-md-69', 'a-lg-69');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-69', 'b-md-69', 'b-lg-69');
      sutA.lg = 'mut-' + 69;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-69"));
      expect(v0).assertEqual("mut-69");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-69"));
      expect(v1).assertEqual("b-lg-69");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7000
     * @tc.name: testBrkIso010070
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010070 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-70', 'a-md-70', 'a-lg-70');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-70', 'b-md-70', 'b-lg-70');
      sutA.lg = 'mut-' + 70;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-70"));
      expect(v0).assertEqual("mut-70");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-70"));
      expect(v1).assertEqual("b-lg-70");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7100
     * @tc.name: testBrkIso010071
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010071 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-71', 'a-md-71', 'a-lg-71');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-71', 'b-md-71', 'b-lg-71');
      sutA.lg = 'mut-' + 71;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-71"));
      expect(v0).assertEqual("mut-71");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-71"));
      expect(v1).assertEqual("b-lg-71");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7200
     * @tc.name: testBrkIso010072
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010072 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-72', 'a-md-72', 'a-lg-72');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-72', 'b-md-72', 'b-lg-72');
      sutA.lg = 'mut-' + 72;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-72"));
      expect(v0).assertEqual("mut-72");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-72"));
      expect(v1).assertEqual("b-lg-72");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7300
     * @tc.name: testBrkIso010073
     * @tc.desc: Verify mutating instance A does not leak into instance B (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkIso010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010073 begin');
      let sutA: BreakpointType<string> = new BreakpointType<string>('a-sm-73', 'a-md-73', 'a-lg-73');
      let sutB: BreakpointType<string> = new BreakpointType<string>('b-sm-73', 'b-md-73', 'b-lg-73');
      sutA.lg = 'mut-' + 73;
      const v0: string | undefined = sutA.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a.lg-after-mutation actual=%{public}s expected=%{public}s', String(v0), String("mut-73"));
      expect(v0).assertEqual("mut-73");
      const v1: string | undefined = sutB.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b.lg-unchanged actual=%{public}s expected=%{public}s', String(v1), String("b-lg-73"));
      expect(v1).assertEqual("b-lg-73");
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(sutA === sutB));
      expect(sutA === sutB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7400
     * @tc.name: testBrkIso010074
     * @tc.desc: Anchor: mutating all three fields of A must leave B untouched
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkIso010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010074 begin');
      let a: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      let b: BreakpointType<number> = new BreakpointType<number>(4, 5, 6);
      a.sm = 10;
      a.md = 20;
      a.lg = 30;
      const v0: number | undefined = b.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b-lg actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number | undefined = a.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a-lg actual=%{public}s expected=%{public}s', String(v1), String(30));
      expect(v1).assertEqual(30);
      const v2: number | undefined = b.getValue('sm');
      hilog.info(DOMAIN, TAG, 'b-sm actual=%{public}s expected=%{public}s', String(v2), String(4));
      expect(v2).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKISO01_7500
     * @tc.name: testBrkIso010075
     * @tc.desc: Anchor: resetting A to the original values must not change B
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkIso010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010075 begin');
      let a: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      let b: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      a.lg = 'z';
      a.lg = 'c';
      const v0: string | undefined = b.getValue('lg');
      hilog.info(DOMAIN, TAG, 'b-lg actual=%{public}s expected=%{public}s', String(v0), String('c'));
      expect(v0).assertEqual('c');
      const v1: string | undefined = a.getValue('lg');
      hilog.info(DOMAIN, TAG, 'a-restored actual=%{public}s expected=%{public}s', String(v1), String('c'));
      expect(v1).assertEqual('c');
      hilog.info(DOMAIN, TAG, 'instances-distinct actual=%{public}s expected=false', String(a === b));
      expect(a === b).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkIso010075 end');
    })

  })
}
