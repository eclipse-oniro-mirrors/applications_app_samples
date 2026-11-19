/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// @volume rule=BreakpointType<number> frozen triple
// -> GetValue(sm/md/lg) selects exact field basis=main-frozen cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPN2]';

export default function bpNumVol02Test() {
  describe('MultiColumnsBpNumVol02', () => {

    /**
     * @tc.name   testBpNumVol0076
     * @tc.number SUB_MC_BPG_0076
     * @tc.desc   Anchor: BreakpointType<number> returns exact frozen value per key (0/-1/9007199254740991)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0076 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(0, -1, 9007199254740991);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(0));
      expect(r0).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(-1));
      expect(r1).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9007199254740991));
      expect(r2).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0076 end');
    });

    /**
     * @tc.name   testBpNumVol0077
     * @tc.number SUB_MC_BPG_0077
     * @tc.desc   Anchor: BreakpointType<number> returns exact frozen value per key (-9007199254740990/0/42)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0077 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(-9007199254740990, 0, 42);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(-9007199254740990));
      expect(r0).assertEqual(-9007199254740990);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(0));
      expect(r1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(42));
      expect(r2).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0077 end');
    });

    /**
     * @tc.name   testBpNumVol0078
     * @tc.number SUB_MC_BPG_0078
     * @tc.desc   BreakpointType<number> triple (78,1046,10014) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0078 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(78, 1046, 10014);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(78));
      expect(r0).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1046));
      expect(r1).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10014));
      expect(r2).assertEqual(10014);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0078 end');
    });

    /**
     * @tc.name   testBpNumVol0079
     * @tc.number SUB_MC_BPG_0079
     * @tc.desc   BreakpointType<number> triple (79,1053,10027) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0079 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(79, 1053, 10027);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(79));
      expect(r0).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1053));
      expect(r1).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10027));
      expect(r2).assertEqual(10027);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0079 end');
    });

    /**
     * @tc.name   testBpNumVol0080
     * @tc.number SUB_MC_BPG_0080
     * @tc.desc   BreakpointType<number> triple (80,1060,10040) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0080 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(80, 1060, 10040);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(80));
      expect(r0).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1060));
      expect(r1).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10040));
      expect(r2).assertEqual(10040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0080 end');
    });

    /**
     * @tc.name   testBpNumVol0081
     * @tc.number SUB_MC_BPG_0081
     * @tc.desc   BreakpointType<number> triple (81,1067,10053) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0081 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(81, 1067, 10053);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(81));
      expect(r0).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1067));
      expect(r1).assertEqual(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10053));
      expect(r2).assertEqual(10053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0081 end');
    });

    /**
     * @tc.name   testBpNumVol0082
     * @tc.number SUB_MC_BPG_0082
     * @tc.desc   BreakpointType<number> triple (82,1074,10066) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0082 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(82, 1074, 10066);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(82));
      expect(r0).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1074));
      expect(r1).assertEqual(1074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10066));
      expect(r2).assertEqual(10066);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0082 end');
    });

    /**
     * @tc.name   testBpNumVol0083
     * @tc.number SUB_MC_BPG_0083
     * @tc.desc   BreakpointType<number> triple (83,1081,10079) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0083 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(83, 1081, 10079);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(83));
      expect(r0).assertEqual(83);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1081));
      expect(r1).assertEqual(1081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10079));
      expect(r2).assertEqual(10079);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0083 end');
    });

    /**
     * @tc.name   testBpNumVol0084
     * @tc.number SUB_MC_BPG_0084
     * @tc.desc   BreakpointType<number> triple (84,1088,10092) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0084 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(84, 1088, 10092);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(84));
      expect(r0).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1088));
      expect(r1).assertEqual(1088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10092));
      expect(r2).assertEqual(10092);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0084 end');
    });

    /**
     * @tc.name   testBpNumVol0085
     * @tc.number SUB_MC_BPG_0085
     * @tc.desc   BreakpointType<number> triple (85,1095,10105) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0085 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(85, 1095, 10105);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(85));
      expect(r0).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1095));
      expect(r1).assertEqual(1095);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10105));
      expect(r2).assertEqual(10105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0085 end');
    });

    /**
     * @tc.name   testBpNumVol0086
     * @tc.number SUB_MC_BPG_0086
     * @tc.desc   BreakpointType<number> triple (86,1102,10118) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0086 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(86, 1102, 10118);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(86));
      expect(r0).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1102));
      expect(r1).assertEqual(1102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10118));
      expect(r2).assertEqual(10118);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0086 end');
    });

    /**
     * @tc.name   testBpNumVol0087
     * @tc.number SUB_MC_BPG_0087
     * @tc.desc   BreakpointType<number> triple (87,1109,10131) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0087 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(87, 1109, 10131);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(87));
      expect(r0).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1109));
      expect(r1).assertEqual(1109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10131));
      expect(r2).assertEqual(10131);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0087 end');
    });

    /**
     * @tc.name   testBpNumVol0088
     * @tc.number SUB_MC_BPG_0088
     * @tc.desc   BreakpointType<number> triple (88,1116,10144) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0088 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(88, 1116, 10144);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(88));
      expect(r0).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1116));
      expect(r1).assertEqual(1116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10144));
      expect(r2).assertEqual(10144);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0088 end');
    });

    /**
     * @tc.name   testBpNumVol0089
     * @tc.number SUB_MC_BPG_0089
     * @tc.desc   BreakpointType<number> triple (89,1123,10157) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0089 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(89, 1123, 10157);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(89));
      expect(r0).assertEqual(89);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1123));
      expect(r1).assertEqual(1123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10157));
      expect(r2).assertEqual(10157);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0089 end');
    });

    /**
     * @tc.name   testBpNumVol0090
     * @tc.number SUB_MC_BPG_0090
     * @tc.desc   BreakpointType<number> triple (90,1130,10170) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0090 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(90, 1130, 10170);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(90));
      expect(r0).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1130));
      expect(r1).assertEqual(1130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10170));
      expect(r2).assertEqual(10170);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0090 end');
    });

    /**
     * @tc.name   testBpNumVol0091
     * @tc.number SUB_MC_BPG_0091
     * @tc.desc   BreakpointType<number> triple (91,1137,10183) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0091 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(91, 1137, 10183);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(91));
      expect(r0).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1137));
      expect(r1).assertEqual(1137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10183));
      expect(r2).assertEqual(10183);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0091 end');
    });

    /**
     * @tc.name   testBpNumVol0092
     * @tc.number SUB_MC_BPG_0092
     * @tc.desc   BreakpointType<number> triple (92,1144,10196) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0092 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(92, 1144, 10196);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(92));
      expect(r0).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1144));
      expect(r1).assertEqual(1144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10196));
      expect(r2).assertEqual(10196);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0092 end');
    });

    /**
     * @tc.name   testBpNumVol0093
     * @tc.number SUB_MC_BPG_0093
     * @tc.desc   BreakpointType<number> triple (93,1151,10209) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0093 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(93, 1151, 10209);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(93));
      expect(r0).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1151));
      expect(r1).assertEqual(1151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10209));
      expect(r2).assertEqual(10209);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0093 end');
    });

    /**
     * @tc.name   testBpNumVol0094
     * @tc.number SUB_MC_BPG_0094
     * @tc.desc   BreakpointType<number> triple (94,1158,10222) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0094 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(94, 1158, 10222);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(94));
      expect(r0).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1158));
      expect(r1).assertEqual(1158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10222));
      expect(r2).assertEqual(10222);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0094 end');
    });

    /**
     * @tc.name   testBpNumVol0095
     * @tc.number SUB_MC_BPG_0095
     * @tc.desc   BreakpointType<number> triple (95,1165,10235) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0095 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(95, 1165, 10235);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(95));
      expect(r0).assertEqual(95);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1165));
      expect(r1).assertEqual(1165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10235));
      expect(r2).assertEqual(10235);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0095 end');
    });

    /**
     * @tc.name   testBpNumVol0096
     * @tc.number SUB_MC_BPG_0096
     * @tc.desc   BreakpointType<number> triple (96,1172,10248) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0096 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(96, 1172, 10248);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(96));
      expect(r0).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1172));
      expect(r1).assertEqual(1172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10248));
      expect(r2).assertEqual(10248);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0096 end');
    });

    /**
     * @tc.name   testBpNumVol0097
     * @tc.number SUB_MC_BPG_0097
     * @tc.desc   BreakpointType<number> triple (97,1179,10261) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0097 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(97, 1179, 10261);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(97));
      expect(r0).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1179));
      expect(r1).assertEqual(1179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10261));
      expect(r2).assertEqual(10261);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0097 end');
    });

    /**
     * @tc.name   testBpNumVol0098
     * @tc.number SUB_MC_BPG_0098
     * @tc.desc   BreakpointType<number> triple (98,1186,10274) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0098 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(98, 1186, 10274);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(98));
      expect(r0).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1186));
      expect(r1).assertEqual(1186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10274));
      expect(r2).assertEqual(10274);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0098 end');
    });

    /**
     * @tc.name   testBpNumVol0099
     * @tc.number SUB_MC_BPG_0099
     * @tc.desc   BreakpointType<number> triple (99,1193,10287) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0099 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(99, 1193, 10287);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(99));
      expect(r0).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1193));
      expect(r1).assertEqual(1193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10287));
      expect(r2).assertEqual(10287);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0099 end');
    });

    /**
     * @tc.name   testBpNumVol0100
     * @tc.number SUB_MC_BPG_0100
     * @tc.desc   BreakpointType<number> triple (100,1200,10300) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0100 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(100, 1200, 10300);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(100));
      expect(r0).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1200));
      expect(r1).assertEqual(1200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10300));
      expect(r2).assertEqual(10300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0100 end');
    });

    /**
     * @tc.name   testBpNumVol0101
     * @tc.number SUB_MC_BPG_0101
     * @tc.desc   BreakpointType<number> triple (101,1207,10313) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0101 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(101, 1207, 10313);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(101));
      expect(r0).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1207));
      expect(r1).assertEqual(1207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10313));
      expect(r2).assertEqual(10313);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0101 end');
    });

    /**
     * @tc.name   testBpNumVol0102
     * @tc.number SUB_MC_BPG_0102
     * @tc.desc   BreakpointType<number> triple (102,1214,10326) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0102 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(102, 1214, 10326);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(102));
      expect(r0).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1214));
      expect(r1).assertEqual(1214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10326));
      expect(r2).assertEqual(10326);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0102 end');
    });

    /**
     * @tc.name   testBpNumVol0103
     * @tc.number SUB_MC_BPG_0103
     * @tc.desc   BreakpointType<number> triple (103,1221,10339) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0103 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(103, 1221, 10339);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(103));
      expect(r0).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1221));
      expect(r1).assertEqual(1221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10339));
      expect(r2).assertEqual(10339);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0103 end');
    });

    /**
     * @tc.name   testBpNumVol0104
     * @tc.number SUB_MC_BPG_0104
     * @tc.desc   BreakpointType<number> triple (104,1228,10352) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0104 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(104, 1228, 10352);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(104));
      expect(r0).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1228));
      expect(r1).assertEqual(1228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10352));
      expect(r2).assertEqual(10352);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0104 end');
    });

    /**
     * @tc.name   testBpNumVol0105
     * @tc.number SUB_MC_BPG_0105
     * @tc.desc   BreakpointType<number> triple (105,1235,10365) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0105 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(105, 1235, 10365);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(105));
      expect(r0).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1235));
      expect(r1).assertEqual(1235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10365));
      expect(r2).assertEqual(10365);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0105 end');
    });

    /**
     * @tc.name   testBpNumVol0106
     * @tc.number SUB_MC_BPG_0106
     * @tc.desc   BreakpointType<number> triple (106,1242,10378) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0106 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(106, 1242, 10378);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(106));
      expect(r0).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1242));
      expect(r1).assertEqual(1242);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10378));
      expect(r2).assertEqual(10378);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0106 end');
    });

    /**
     * @tc.name   testBpNumVol0107
     * @tc.number SUB_MC_BPG_0107
     * @tc.desc   BreakpointType<number> triple (107,1249,10391) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0107 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(107, 1249, 10391);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(107));
      expect(r0).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1249));
      expect(r1).assertEqual(1249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10391));
      expect(r2).assertEqual(10391);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0107 end');
    });

    /**
     * @tc.name   testBpNumVol0108
     * @tc.number SUB_MC_BPG_0108
     * @tc.desc   BreakpointType<number> triple (108,1256,10404) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0108 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(108, 1256, 10404);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(108));
      expect(r0).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1256));
      expect(r1).assertEqual(1256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10404));
      expect(r2).assertEqual(10404);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0108 end');
    });

    /**
     * @tc.name   testBpNumVol0109
     * @tc.number SUB_MC_BPG_0109
     * @tc.desc   BreakpointType<number> triple (109,1263,10417) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0109 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(109, 1263, 10417);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(109));
      expect(r0).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1263));
      expect(r1).assertEqual(1263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10417));
      expect(r2).assertEqual(10417);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0109 end');
    });

    /**
     * @tc.name   testBpNumVol0110
     * @tc.number SUB_MC_BPG_0110
     * @tc.desc   BreakpointType<number> triple (110,1270,10430) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0110 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(110, 1270, 10430);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(110));
      expect(r0).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1270));
      expect(r1).assertEqual(1270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10430));
      expect(r2).assertEqual(10430);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0110 end');
    });

    /**
     * @tc.name   testBpNumVol0111
     * @tc.number SUB_MC_BPG_0111
     * @tc.desc   BreakpointType<number> triple (111,1277,10443) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0111 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(111, 1277, 10443);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(111));
      expect(r0).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1277));
      expect(r1).assertEqual(1277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10443));
      expect(r2).assertEqual(10443);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0111 end');
    });

    /**
     * @tc.name   testBpNumVol0112
     * @tc.number SUB_MC_BPG_0112
     * @tc.desc   BreakpointType<number> triple (112,1284,10456) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0112 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(112, 1284, 10456);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(112));
      expect(r0).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1284));
      expect(r1).assertEqual(1284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10456));
      expect(r2).assertEqual(10456);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0112 end');
    });

    /**
     * @tc.name   testBpNumVol0113
     * @tc.number SUB_MC_BPG_0113
     * @tc.desc   BreakpointType<number> triple (113,1291,10469) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0113 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(113, 1291, 10469);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(113));
      expect(r0).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1291));
      expect(r1).assertEqual(1291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10469));
      expect(r2).assertEqual(10469);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0113 end');
    });

    /**
     * @tc.name   testBpNumVol0114
     * @tc.number SUB_MC_BPG_0114
     * @tc.desc   BreakpointType<number> triple (114,1298,10482) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0114 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(114, 1298, 10482);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(114));
      expect(r0).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1298));
      expect(r1).assertEqual(1298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10482));
      expect(r2).assertEqual(10482);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0114 end');
    });

    /**
     * @tc.name   testBpNumVol0115
     * @tc.number SUB_MC_BPG_0115
     * @tc.desc   BreakpointType<number> triple (115,1305,10495) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0115 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(115, 1305, 10495);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(115));
      expect(r0).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1305));
      expect(r1).assertEqual(1305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10495));
      expect(r2).assertEqual(10495);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0115 end');
    });

    /**
     * @tc.name   testBpNumVol0116
     * @tc.number SUB_MC_BPG_0116
     * @tc.desc   BreakpointType<number> triple (116,1312,10508) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0116 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(116, 1312, 10508);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(116));
      expect(r0).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1312));
      expect(r1).assertEqual(1312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10508));
      expect(r2).assertEqual(10508);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0116 end');
    });

    /**
     * @tc.name   testBpNumVol0117
     * @tc.number SUB_MC_BPG_0117
     * @tc.desc   BreakpointType<number> triple (117,1319,10521) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0117 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(117, 1319, 10521);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(117));
      expect(r0).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1319));
      expect(r1).assertEqual(1319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10521));
      expect(r2).assertEqual(10521);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0117 end');
    });

    /**
     * @tc.name   testBpNumVol0118
     * @tc.number SUB_MC_BPG_0118
     * @tc.desc   BreakpointType<number> triple (118,1326,10534) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0118 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(118, 1326, 10534);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(118));
      expect(r0).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1326));
      expect(r1).assertEqual(1326);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10534));
      expect(r2).assertEqual(10534);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0118 end');
    });

    /**
     * @tc.name   testBpNumVol0119
     * @tc.number SUB_MC_BPG_0119
     * @tc.desc   BreakpointType<number> triple (119,1333,10547) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0119 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(119, 1333, 10547);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(119));
      expect(r0).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1333));
      expect(r1).assertEqual(1333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10547));
      expect(r2).assertEqual(10547);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0119 end');
    });

    /**
     * @tc.name   testBpNumVol0120
     * @tc.number SUB_MC_BPG_0120
     * @tc.desc   BreakpointType<number> triple (120,1340,10560) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0120 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(120, 1340, 10560);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(120));
      expect(r0).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1340));
      expect(r1).assertEqual(1340);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10560));
      expect(r2).assertEqual(10560);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0120 end');
    });

    /**
     * @tc.name   testBpNumVol0121
     * @tc.number SUB_MC_BPG_0121
     * @tc.desc   BreakpointType<number> triple (121,1347,10573) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0121 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(121, 1347, 10573);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(121));
      expect(r0).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1347));
      expect(r1).assertEqual(1347);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10573));
      expect(r2).assertEqual(10573);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0121 end');
    });

    /**
     * @tc.name   testBpNumVol0122
     * @tc.number SUB_MC_BPG_0122
     * @tc.desc   BreakpointType<number> triple (122,1354,10586) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0122 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(122, 1354, 10586);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(122));
      expect(r0).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1354));
      expect(r1).assertEqual(1354);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10586));
      expect(r2).assertEqual(10586);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0122 end');
    });

    /**
     * @tc.name   testBpNumVol0123
     * @tc.number SUB_MC_BPG_0123
     * @tc.desc   BreakpointType<number> triple (123,1361,10599) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0123 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(123, 1361, 10599);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(123));
      expect(r0).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1361));
      expect(r1).assertEqual(1361);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10599));
      expect(r2).assertEqual(10599);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0123 end');
    });

    /**
     * @tc.name   testBpNumVol0124
     * @tc.number SUB_MC_BPG_0124
     * @tc.desc   BreakpointType<number> triple (124,1368,10612) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0124 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(124, 1368, 10612);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(124));
      expect(r0).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1368));
      expect(r1).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10612));
      expect(r2).assertEqual(10612);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0124 end');
    });

    /**
     * @tc.name   testBpNumVol0125
     * @tc.number SUB_MC_BPG_0125
     * @tc.desc   BreakpointType<number> triple (125,1375,10625) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0125 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(125, 1375, 10625);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(125));
      expect(r0).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1375));
      expect(r1).assertEqual(1375);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10625));
      expect(r2).assertEqual(10625);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0125 end');
    });

    /**
     * @tc.name   testBpNumVol0126
     * @tc.number SUB_MC_BPG_0126
     * @tc.desc   BreakpointType<number> triple (126,1382,10638) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0126 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(126, 1382, 10638);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(126));
      expect(r0).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1382));
      expect(r1).assertEqual(1382);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10638));
      expect(r2).assertEqual(10638);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0126 end');
    });

    /**
     * @tc.name   testBpNumVol0127
     * @tc.number SUB_MC_BPG_0127
     * @tc.desc   BreakpointType<number> triple (127,1389,10651) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0127 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(127, 1389, 10651);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(127));
      expect(r0).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1389));
      expect(r1).assertEqual(1389);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10651));
      expect(r2).assertEqual(10651);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0127 end');
    });

    /**
     * @tc.name   testBpNumVol0128
     * @tc.number SUB_MC_BPG_0128
     * @tc.desc   BreakpointType<number> triple (128,1396,10664) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0128 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(128, 1396, 10664);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(128));
      expect(r0).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1396));
      expect(r1).assertEqual(1396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10664));
      expect(r2).assertEqual(10664);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0128 end');
    });

    /**
     * @tc.name   testBpNumVol0129
     * @tc.number SUB_MC_BPG_0129
     * @tc.desc   BreakpointType<number> triple (129,1403,10677) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0129 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(129, 1403, 10677);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(129));
      expect(r0).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1403));
      expect(r1).assertEqual(1403);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10677));
      expect(r2).assertEqual(10677);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0129 end');
    });

    /**
     * @tc.name   testBpNumVol0130
     * @tc.number SUB_MC_BPG_0130
     * @tc.desc   BreakpointType<number> triple (130,1410,10690) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0130 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(130, 1410, 10690);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(130));
      expect(r0).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1410));
      expect(r1).assertEqual(1410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10690));
      expect(r2).assertEqual(10690);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0130 end');
    });

    /**
     * @tc.name   testBpNumVol0131
     * @tc.number SUB_MC_BPG_0131
     * @tc.desc   BreakpointType<number> triple (131,1417,10703) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0131 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(131, 1417, 10703);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(131));
      expect(r0).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1417));
      expect(r1).assertEqual(1417);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10703));
      expect(r2).assertEqual(10703);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0131 end');
    });

    /**
     * @tc.name   testBpNumVol0132
     * @tc.number SUB_MC_BPG_0132
     * @tc.desc   BreakpointType<number> triple (132,1424,10716) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0132 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(132, 1424, 10716);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(132));
      expect(r0).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1424));
      expect(r1).assertEqual(1424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10716));
      expect(r2).assertEqual(10716);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0132 end');
    });

    /**
     * @tc.name   testBpNumVol0133
     * @tc.number SUB_MC_BPG_0133
     * @tc.desc   BreakpointType<number> triple (133,1431,10729) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0133 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(133, 1431, 10729);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(133));
      expect(r0).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1431));
      expect(r1).assertEqual(1431);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10729));
      expect(r2).assertEqual(10729);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0133 end');
    });

    /**
     * @tc.name   testBpNumVol0134
     * @tc.number SUB_MC_BPG_0134
     * @tc.desc   BreakpointType<number> triple (134,1438,10742) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0134 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(134, 1438, 10742);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(134));
      expect(r0).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1438));
      expect(r1).assertEqual(1438);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10742));
      expect(r2).assertEqual(10742);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0134 end');
    });

    /**
     * @tc.name   testBpNumVol0135
     * @tc.number SUB_MC_BPG_0135
     * @tc.desc   BreakpointType<number> triple (135,1445,10755) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0135 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(135, 1445, 10755);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(135));
      expect(r0).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1445));
      expect(r1).assertEqual(1445);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10755));
      expect(r2).assertEqual(10755);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0135 end');
    });

    /**
     * @tc.name   testBpNumVol0136
     * @tc.number SUB_MC_BPG_0136
     * @tc.desc   BreakpointType<number> triple (136,1452,10768) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0136 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(136, 1452, 10768);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(136));
      expect(r0).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1452));
      expect(r1).assertEqual(1452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10768));
      expect(r2).assertEqual(10768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0136 end');
    });

    /**
     * @tc.name   testBpNumVol0137
     * @tc.number SUB_MC_BPG_0137
     * @tc.desc   BreakpointType<number> triple (137,1459,10781) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0137 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(137, 1459, 10781);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(137));
      expect(r0).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1459));
      expect(r1).assertEqual(1459);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10781));
      expect(r2).assertEqual(10781);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0137 end');
    });

    /**
     * @tc.name   testBpNumVol0138
     * @tc.number SUB_MC_BPG_0138
     * @tc.desc   BreakpointType<number> triple (138,1466,10794) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0138 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(138, 1466, 10794);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(138));
      expect(r0).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1466));
      expect(r1).assertEqual(1466);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10794));
      expect(r2).assertEqual(10794);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0138 end');
    });

    /**
     * @tc.name   testBpNumVol0139
     * @tc.number SUB_MC_BPG_0139
     * @tc.desc   BreakpointType<number> triple (139,1473,10807) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0139 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(139, 1473, 10807);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(139));
      expect(r0).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1473));
      expect(r1).assertEqual(1473);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10807));
      expect(r2).assertEqual(10807);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0139 end');
    });

    /**
     * @tc.name   testBpNumVol0140
     * @tc.number SUB_MC_BPG_0140
     * @tc.desc   BreakpointType<number> triple (140,1480,10820) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0140 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(140, 1480, 10820);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(140));
      expect(r0).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1480));
      expect(r1).assertEqual(1480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10820));
      expect(r2).assertEqual(10820);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0140 end');
    });

    /**
     * @tc.name   testBpNumVol0141
     * @tc.number SUB_MC_BPG_0141
     * @tc.desc   BreakpointType<number> triple (141,1487,10833) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0141 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(141, 1487, 10833);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(141));
      expect(r0).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1487));
      expect(r1).assertEqual(1487);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10833));
      expect(r2).assertEqual(10833);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0141 end');
    });

    /**
     * @tc.name   testBpNumVol0142
     * @tc.number SUB_MC_BPG_0142
     * @tc.desc   BreakpointType<number> triple (142,1494,10846) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0142 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(142, 1494, 10846);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(142));
      expect(r0).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1494));
      expect(r1).assertEqual(1494);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10846));
      expect(r2).assertEqual(10846);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0142 end');
    });

    /**
     * @tc.name   testBpNumVol0143
     * @tc.number SUB_MC_BPG_0143
     * @tc.desc   BreakpointType<number> triple (143,1501,10859) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0143 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(143, 1501, 10859);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(143));
      expect(r0).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1501));
      expect(r1).assertEqual(1501);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10859));
      expect(r2).assertEqual(10859);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0143 end');
    });

    /**
     * @tc.name   testBpNumVol0144
     * @tc.number SUB_MC_BPG_0144
     * @tc.desc   BreakpointType<number> triple (144,1508,10872) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0144 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(144, 1508, 10872);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(144));
      expect(r0).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1508));
      expect(r1).assertEqual(1508);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10872));
      expect(r2).assertEqual(10872);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0144 end');
    });

    /**
     * @tc.name   testBpNumVol0145
     * @tc.number SUB_MC_BPG_0145
     * @tc.desc   BreakpointType<number> triple (145,1515,10885) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0145 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(145, 1515, 10885);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(145));
      expect(r0).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1515));
      expect(r1).assertEqual(1515);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10885));
      expect(r2).assertEqual(10885);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0145 end');
    });

    /**
     * @tc.name   testBpNumVol0146
     * @tc.number SUB_MC_BPG_0146
     * @tc.desc   BreakpointType<number> triple (146,1522,10898) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0146 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(146, 1522, 10898);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(146));
      expect(r0).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1522));
      expect(r1).assertEqual(1522);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10898));
      expect(r2).assertEqual(10898);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0146 end');
    });

    /**
     * @tc.name   testBpNumVol0147
     * @tc.number SUB_MC_BPG_0147
     * @tc.desc   BreakpointType<number> triple (147,1529,10911) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0147 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(147, 1529, 10911);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(147));
      expect(r0).assertEqual(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1529));
      expect(r1).assertEqual(1529);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10911));
      expect(r2).assertEqual(10911);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0147 end');
    });

    /**
     * @tc.name   testBpNumVol0148
     * @tc.number SUB_MC_BPG_0148
     * @tc.desc   BreakpointType<number> triple (148,1536,10924) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0148 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(148, 1536, 10924);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(148));
      expect(r0).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1536));
      expect(r1).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10924));
      expect(r2).assertEqual(10924);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0148 end');
    });

    /**
     * @tc.name   testBpNumVol0149
     * @tc.number SUB_MC_BPG_0149
     * @tc.desc   BreakpointType<number> triple (149,1543,10937) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0149 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(149, 1543, 10937);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(149));
      expect(r0).assertEqual(149);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1543));
      expect(r1).assertEqual(1543);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10937));
      expect(r2).assertEqual(10937);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0149 end');
    });

    /**
     * @tc.name   testBpNumVol0150
     * @tc.number SUB_MC_BPG_0150
     * @tc.desc   BreakpointType<number> triple (150,1550,10950) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0150 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(150, 1550, 10950);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(150));
      expect(r0).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1550));
      expect(r1).assertEqual(1550);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(10950));
      expect(r2).assertEqual(10950);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0150 end');
    });

  });
}
