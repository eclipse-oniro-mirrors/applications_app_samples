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
const LOG_TAG: string = '[MultiColumns_BPN1]';

export default function bpNumVol01Test() {
  describe('MultiColumnsBpNumVol01', () => {

    /**
     * @tc.name   testBpNumVol0001
     * @tc.number SUB_MC_BPG_0001
     * @tc.desc   Anchor: BreakpointType<number> returns exact frozen value per key (0/-1/9007199254740991)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0001 end');
    });

    /**
     * @tc.name   testBpNumVol0002
     * @tc.number SUB_MC_BPG_0002
     * @tc.desc   Anchor: BreakpointType<number> returns exact frozen value per key (-9007199254740990/0/42)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0002 end');
    });

    /**
     * @tc.name   testBpNumVol0003
     * @tc.number SUB_MC_BPG_0003
     * @tc.desc   BreakpointType<number> triple (3,521,9039) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0003 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(3, 521, 9039);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(3));
      expect(r0).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(521));
      expect(r1).assertEqual(521);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9039));
      expect(r2).assertEqual(9039);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0003 end');
    });

    /**
     * @tc.name   testBpNumVol0004
     * @tc.number SUB_MC_BPG_0004
     * @tc.desc   BreakpointType<number> triple (4,528,9052) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0004 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(4, 528, 9052);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(4));
      expect(r0).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(528));
      expect(r1).assertEqual(528);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9052));
      expect(r2).assertEqual(9052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0004 end');
    });

    /**
     * @tc.name   testBpNumVol0005
     * @tc.number SUB_MC_BPG_0005
     * @tc.desc   BreakpointType<number> triple (5,535,9065) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0005 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(5, 535, 9065);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(5));
      expect(r0).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(535));
      expect(r1).assertEqual(535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9065));
      expect(r2).assertEqual(9065);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0005 end');
    });

    /**
     * @tc.name   testBpNumVol0006
     * @tc.number SUB_MC_BPG_0006
     * @tc.desc   BreakpointType<number> triple (6,542,9078) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0006 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(6, 542, 9078);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(6));
      expect(r0).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(542));
      expect(r1).assertEqual(542);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9078));
      expect(r2).assertEqual(9078);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0006 end');
    });

    /**
     * @tc.name   testBpNumVol0007
     * @tc.number SUB_MC_BPG_0007
     * @tc.desc   BreakpointType<number> triple (7,549,9091) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0007 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(7, 549, 9091);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(7));
      expect(r0).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(549));
      expect(r1).assertEqual(549);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9091));
      expect(r2).assertEqual(9091);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0007 end');
    });

    /**
     * @tc.name   testBpNumVol0008
     * @tc.number SUB_MC_BPG_0008
     * @tc.desc   BreakpointType<number> triple (8,556,9104) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0008 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(8, 556, 9104);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(8));
      expect(r0).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(556));
      expect(r1).assertEqual(556);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9104));
      expect(r2).assertEqual(9104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0008 end');
    });

    /**
     * @tc.name   testBpNumVol0009
     * @tc.number SUB_MC_BPG_0009
     * @tc.desc   BreakpointType<number> triple (9,563,9117) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0009 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(9, 563, 9117);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(9));
      expect(r0).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(563));
      expect(r1).assertEqual(563);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9117));
      expect(r2).assertEqual(9117);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0009 end');
    });

    /**
     * @tc.name   testBpNumVol0010
     * @tc.number SUB_MC_BPG_0010
     * @tc.desc   BreakpointType<number> triple (10,570,9130) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0010 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 570, 9130);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(10));
      expect(r0).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(570));
      expect(r1).assertEqual(570);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9130));
      expect(r2).assertEqual(9130);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0010 end');
    });

    /**
     * @tc.name   testBpNumVol0011
     * @tc.number SUB_MC_BPG_0011
     * @tc.desc   BreakpointType<number> triple (11,577,9143) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0011 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(11, 577, 9143);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(11));
      expect(r0).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(577));
      expect(r1).assertEqual(577);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9143));
      expect(r2).assertEqual(9143);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0011 end');
    });

    /**
     * @tc.name   testBpNumVol0012
     * @tc.number SUB_MC_BPG_0012
     * @tc.desc   BreakpointType<number> triple (12,584,9156) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0012 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(12, 584, 9156);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(12));
      expect(r0).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(584));
      expect(r1).assertEqual(584);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9156));
      expect(r2).assertEqual(9156);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0012 end');
    });

    /**
     * @tc.name   testBpNumVol0013
     * @tc.number SUB_MC_BPG_0013
     * @tc.desc   BreakpointType<number> triple (13,591,9169) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0013 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(13, 591, 9169);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(13));
      expect(r0).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(591));
      expect(r1).assertEqual(591);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9169));
      expect(r2).assertEqual(9169);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0013 end');
    });

    /**
     * @tc.name   testBpNumVol0014
     * @tc.number SUB_MC_BPG_0014
     * @tc.desc   BreakpointType<number> triple (14,598,9182) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0014 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(14, 598, 9182);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(14));
      expect(r0).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(598));
      expect(r1).assertEqual(598);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9182));
      expect(r2).assertEqual(9182);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0014 end');
    });

    /**
     * @tc.name   testBpNumVol0015
     * @tc.number SUB_MC_BPG_0015
     * @tc.desc   BreakpointType<number> triple (15,605,9195) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0015 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(15, 605, 9195);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(15));
      expect(r0).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(605));
      expect(r1).assertEqual(605);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9195));
      expect(r2).assertEqual(9195);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0015 end');
    });

    /**
     * @tc.name   testBpNumVol0016
     * @tc.number SUB_MC_BPG_0016
     * @tc.desc   BreakpointType<number> triple (16,612,9208) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0016 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(16, 612, 9208);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(16));
      expect(r0).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(612));
      expect(r1).assertEqual(612);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9208));
      expect(r2).assertEqual(9208);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0016 end');
    });

    /**
     * @tc.name   testBpNumVol0017
     * @tc.number SUB_MC_BPG_0017
     * @tc.desc   BreakpointType<number> triple (17,619,9221) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0017 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(17, 619, 9221);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(17));
      expect(r0).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(619));
      expect(r1).assertEqual(619);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9221));
      expect(r2).assertEqual(9221);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0017 end');
    });

    /**
     * @tc.name   testBpNumVol0018
     * @tc.number SUB_MC_BPG_0018
     * @tc.desc   BreakpointType<number> triple (18,626,9234) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0018 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(18, 626, 9234);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(18));
      expect(r0).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(626));
      expect(r1).assertEqual(626);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9234));
      expect(r2).assertEqual(9234);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0018 end');
    });

    /**
     * @tc.name   testBpNumVol0019
     * @tc.number SUB_MC_BPG_0019
     * @tc.desc   BreakpointType<number> triple (19,633,9247) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0019 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(19, 633, 9247);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(19));
      expect(r0).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(633));
      expect(r1).assertEqual(633);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9247));
      expect(r2).assertEqual(9247);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0019 end');
    });

    /**
     * @tc.name   testBpNumVol0020
     * @tc.number SUB_MC_BPG_0020
     * @tc.desc   BreakpointType<number> triple (20,640,9260) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0020 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(20, 640, 9260);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(20));
      expect(r0).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(640));
      expect(r1).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9260));
      expect(r2).assertEqual(9260);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0020 end');
    });

    /**
     * @tc.name   testBpNumVol0021
     * @tc.number SUB_MC_BPG_0021
     * @tc.desc   BreakpointType<number> triple (21,647,9273) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0021 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(21, 647, 9273);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(21));
      expect(r0).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(647));
      expect(r1).assertEqual(647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9273));
      expect(r2).assertEqual(9273);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0021 end');
    });

    /**
     * @tc.name   testBpNumVol0022
     * @tc.number SUB_MC_BPG_0022
     * @tc.desc   BreakpointType<number> triple (22,654,9286) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0022 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(22, 654, 9286);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(22));
      expect(r0).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(654));
      expect(r1).assertEqual(654);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9286));
      expect(r2).assertEqual(9286);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0022 end');
    });

    /**
     * @tc.name   testBpNumVol0023
     * @tc.number SUB_MC_BPG_0023
     * @tc.desc   BreakpointType<number> triple (23,661,9299) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0023 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(23, 661, 9299);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(23));
      expect(r0).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(661));
      expect(r1).assertEqual(661);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9299));
      expect(r2).assertEqual(9299);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0023 end');
    });

    /**
     * @tc.name   testBpNumVol0024
     * @tc.number SUB_MC_BPG_0024
     * @tc.desc   BreakpointType<number> triple (24,668,9312) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0024 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(24, 668, 9312);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(24));
      expect(r0).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(668));
      expect(r1).assertEqual(668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9312));
      expect(r2).assertEqual(9312);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0024 end');
    });

    /**
     * @tc.name   testBpNumVol0025
     * @tc.number SUB_MC_BPG_0025
     * @tc.desc   BreakpointType<number> triple (25,675,9325) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0025 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(25, 675, 9325);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(25));
      expect(r0).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(675));
      expect(r1).assertEqual(675);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9325));
      expect(r2).assertEqual(9325);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0025 end');
    });

    /**
     * @tc.name   testBpNumVol0026
     * @tc.number SUB_MC_BPG_0026
     * @tc.desc   BreakpointType<number> triple (26,682,9338) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0026 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(26, 682, 9338);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(26));
      expect(r0).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(682));
      expect(r1).assertEqual(682);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9338));
      expect(r2).assertEqual(9338);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0026 end');
    });

    /**
     * @tc.name   testBpNumVol0027
     * @tc.number SUB_MC_BPG_0027
     * @tc.desc   BreakpointType<number> triple (27,689,9351) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0027 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(27, 689, 9351);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(27));
      expect(r0).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(689));
      expect(r1).assertEqual(689);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9351));
      expect(r2).assertEqual(9351);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0027 end');
    });

    /**
     * @tc.name   testBpNumVol0028
     * @tc.number SUB_MC_BPG_0028
     * @tc.desc   BreakpointType<number> triple (28,696,9364) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0028 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(28, 696, 9364);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(28));
      expect(r0).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(696));
      expect(r1).assertEqual(696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9364));
      expect(r2).assertEqual(9364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0028 end');
    });

    /**
     * @tc.name   testBpNumVol0029
     * @tc.number SUB_MC_BPG_0029
     * @tc.desc   BreakpointType<number> triple (29,703,9377) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0029 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(29, 703, 9377);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(29));
      expect(r0).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(703));
      expect(r1).assertEqual(703);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9377));
      expect(r2).assertEqual(9377);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0029 end');
    });

    /**
     * @tc.name   testBpNumVol0030
     * @tc.number SUB_MC_BPG_0030
     * @tc.desc   BreakpointType<number> triple (30,710,9390) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0030 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(30, 710, 9390);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(30));
      expect(r0).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(710));
      expect(r1).assertEqual(710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9390));
      expect(r2).assertEqual(9390);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0030 end');
    });

    /**
     * @tc.name   testBpNumVol0031
     * @tc.number SUB_MC_BPG_0031
     * @tc.desc   BreakpointType<number> triple (31,717,9403) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0031 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(31, 717, 9403);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(31));
      expect(r0).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(717));
      expect(r1).assertEqual(717);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9403));
      expect(r2).assertEqual(9403);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0031 end');
    });

    /**
     * @tc.name   testBpNumVol0032
     * @tc.number SUB_MC_BPG_0032
     * @tc.desc   BreakpointType<number> triple (32,724,9416) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0032 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(32, 724, 9416);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(32));
      expect(r0).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(724));
      expect(r1).assertEqual(724);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9416));
      expect(r2).assertEqual(9416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0032 end');
    });

    /**
     * @tc.name   testBpNumVol0033
     * @tc.number SUB_MC_BPG_0033
     * @tc.desc   BreakpointType<number> triple (33,731,9429) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0033 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(33, 731, 9429);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(33));
      expect(r0).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(731));
      expect(r1).assertEqual(731);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9429));
      expect(r2).assertEqual(9429);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0033 end');
    });

    /**
     * @tc.name   testBpNumVol0034
     * @tc.number SUB_MC_BPG_0034
     * @tc.desc   BreakpointType<number> triple (34,738,9442) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0034 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(34, 738, 9442);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(34));
      expect(r0).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(738));
      expect(r1).assertEqual(738);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9442));
      expect(r2).assertEqual(9442);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0034 end');
    });

    /**
     * @tc.name   testBpNumVol0035
     * @tc.number SUB_MC_BPG_0035
     * @tc.desc   BreakpointType<number> triple (35,745,9455) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0035 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(35, 745, 9455);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(35));
      expect(r0).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(745));
      expect(r1).assertEqual(745);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9455));
      expect(r2).assertEqual(9455);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0035 end');
    });

    /**
     * @tc.name   testBpNumVol0036
     * @tc.number SUB_MC_BPG_0036
     * @tc.desc   BreakpointType<number> triple (36,752,9468) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0036 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(36, 752, 9468);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(36));
      expect(r0).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(752));
      expect(r1).assertEqual(752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9468));
      expect(r2).assertEqual(9468);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0036 end');
    });

    /**
     * @tc.name   testBpNumVol0037
     * @tc.number SUB_MC_BPG_0037
     * @tc.desc   BreakpointType<number> triple (37,759,9481) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0037 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(37, 759, 9481);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(37));
      expect(r0).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(759));
      expect(r1).assertEqual(759);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9481));
      expect(r2).assertEqual(9481);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0037 end');
    });

    /**
     * @tc.name   testBpNumVol0038
     * @tc.number SUB_MC_BPG_0038
     * @tc.desc   BreakpointType<number> triple (38,766,9494) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0038 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(38, 766, 9494);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(38));
      expect(r0).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(766));
      expect(r1).assertEqual(766);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9494));
      expect(r2).assertEqual(9494);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0038 end');
    });

    /**
     * @tc.name   testBpNumVol0039
     * @tc.number SUB_MC_BPG_0039
     * @tc.desc   BreakpointType<number> triple (39,773,9507) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0039 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(39, 773, 9507);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(39));
      expect(r0).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(773));
      expect(r1).assertEqual(773);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9507));
      expect(r2).assertEqual(9507);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0039 end');
    });

    /**
     * @tc.name   testBpNumVol0040
     * @tc.number SUB_MC_BPG_0040
     * @tc.desc   BreakpointType<number> triple (40,780,9520) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0040 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(40, 780, 9520);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(40));
      expect(r0).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(780));
      expect(r1).assertEqual(780);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9520));
      expect(r2).assertEqual(9520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0040 end');
    });

    /**
     * @tc.name   testBpNumVol0041
     * @tc.number SUB_MC_BPG_0041
     * @tc.desc   BreakpointType<number> triple (41,787,9533) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0041 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(41, 787, 9533);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(41));
      expect(r0).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(787));
      expect(r1).assertEqual(787);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9533));
      expect(r2).assertEqual(9533);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0041 end');
    });

    /**
     * @tc.name   testBpNumVol0042
     * @tc.number SUB_MC_BPG_0042
     * @tc.desc   BreakpointType<number> triple (42,794,9546) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0042 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(42, 794, 9546);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(42));
      expect(r0).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(794));
      expect(r1).assertEqual(794);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9546));
      expect(r2).assertEqual(9546);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0042 end');
    });

    /**
     * @tc.name   testBpNumVol0043
     * @tc.number SUB_MC_BPG_0043
     * @tc.desc   BreakpointType<number> triple (43,801,9559) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0043 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(43, 801, 9559);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(43));
      expect(r0).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(801));
      expect(r1).assertEqual(801);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9559));
      expect(r2).assertEqual(9559);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0043 end');
    });

    /**
     * @tc.name   testBpNumVol0044
     * @tc.number SUB_MC_BPG_0044
     * @tc.desc   BreakpointType<number> triple (44,808,9572) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0044 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(44, 808, 9572);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(44));
      expect(r0).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(808));
      expect(r1).assertEqual(808);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9572));
      expect(r2).assertEqual(9572);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0044 end');
    });

    /**
     * @tc.name   testBpNumVol0045
     * @tc.number SUB_MC_BPG_0045
     * @tc.desc   BreakpointType<number> triple (45,815,9585) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0045 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(45, 815, 9585);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(45));
      expect(r0).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(815));
      expect(r1).assertEqual(815);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9585));
      expect(r2).assertEqual(9585);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0045 end');
    });

    /**
     * @tc.name   testBpNumVol0046
     * @tc.number SUB_MC_BPG_0046
     * @tc.desc   BreakpointType<number> triple (46,822,9598) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0046 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(46, 822, 9598);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(46));
      expect(r0).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(822));
      expect(r1).assertEqual(822);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9598));
      expect(r2).assertEqual(9598);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0046 end');
    });

    /**
     * @tc.name   testBpNumVol0047
     * @tc.number SUB_MC_BPG_0047
     * @tc.desc   BreakpointType<number> triple (47,829,9611) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0047 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(47, 829, 9611);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(47));
      expect(r0).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(829));
      expect(r1).assertEqual(829);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9611));
      expect(r2).assertEqual(9611);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0047 end');
    });

    /**
     * @tc.name   testBpNumVol0048
     * @tc.number SUB_MC_BPG_0048
     * @tc.desc   BreakpointType<number> triple (48,836,9624) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0048 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(48, 836, 9624);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(48));
      expect(r0).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(836));
      expect(r1).assertEqual(836);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9624));
      expect(r2).assertEqual(9624);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0048 end');
    });

    /**
     * @tc.name   testBpNumVol0049
     * @tc.number SUB_MC_BPG_0049
     * @tc.desc   BreakpointType<number> triple (49,843,9637) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0049 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(49, 843, 9637);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(49));
      expect(r0).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(843));
      expect(r1).assertEqual(843);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9637));
      expect(r2).assertEqual(9637);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0049 end');
    });

    /**
     * @tc.name   testBpNumVol0050
     * @tc.number SUB_MC_BPG_0050
     * @tc.desc   BreakpointType<number> triple (50,850,9650) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0050 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(50, 850, 9650);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(50));
      expect(r0).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(850));
      expect(r1).assertEqual(850);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9650));
      expect(r2).assertEqual(9650);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0050 end');
    });

    /**
     * @tc.name   testBpNumVol0051
     * @tc.number SUB_MC_BPG_0051
     * @tc.desc   BreakpointType<number> triple (51,857,9663) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0051 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(51, 857, 9663);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(51));
      expect(r0).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(857));
      expect(r1).assertEqual(857);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9663));
      expect(r2).assertEqual(9663);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0051 end');
    });

    /**
     * @tc.name   testBpNumVol0052
     * @tc.number SUB_MC_BPG_0052
     * @tc.desc   BreakpointType<number> triple (52,864,9676) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0052 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(52, 864, 9676);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(52));
      expect(r0).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(864));
      expect(r1).assertEqual(864);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9676));
      expect(r2).assertEqual(9676);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0052 end');
    });

    /**
     * @tc.name   testBpNumVol0053
     * @tc.number SUB_MC_BPG_0053
     * @tc.desc   BreakpointType<number> triple (53,871,9689) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0053 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(53, 871, 9689);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(53));
      expect(r0).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(871));
      expect(r1).assertEqual(871);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9689));
      expect(r2).assertEqual(9689);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0053 end');
    });

    /**
     * @tc.name   testBpNumVol0054
     * @tc.number SUB_MC_BPG_0054
     * @tc.desc   BreakpointType<number> triple (54,878,9702) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0054 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(54, 878, 9702);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(54));
      expect(r0).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(878));
      expect(r1).assertEqual(878);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9702));
      expect(r2).assertEqual(9702);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0054 end');
    });

    /**
     * @tc.name   testBpNumVol0055
     * @tc.number SUB_MC_BPG_0055
     * @tc.desc   BreakpointType<number> triple (55,885,9715) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0055 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(55, 885, 9715);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(55));
      expect(r0).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(885));
      expect(r1).assertEqual(885);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9715));
      expect(r2).assertEqual(9715);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0055 end');
    });

    /**
     * @tc.name   testBpNumVol0056
     * @tc.number SUB_MC_BPG_0056
     * @tc.desc   BreakpointType<number> triple (56,892,9728) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0056 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(56, 892, 9728);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(56));
      expect(r0).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(892));
      expect(r1).assertEqual(892);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9728));
      expect(r2).assertEqual(9728);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0056 end');
    });

    /**
     * @tc.name   testBpNumVol0057
     * @tc.number SUB_MC_BPG_0057
     * @tc.desc   BreakpointType<number> triple (57,899,9741) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0057 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(57, 899, 9741);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(57));
      expect(r0).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(899));
      expect(r1).assertEqual(899);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9741));
      expect(r2).assertEqual(9741);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0057 end');
    });

    /**
     * @tc.name   testBpNumVol0058
     * @tc.number SUB_MC_BPG_0058
     * @tc.desc   BreakpointType<number> triple (58,906,9754) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0058 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(58, 906, 9754);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(58));
      expect(r0).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(906));
      expect(r1).assertEqual(906);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9754));
      expect(r2).assertEqual(9754);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0058 end');
    });

    /**
     * @tc.name   testBpNumVol0059
     * @tc.number SUB_MC_BPG_0059
     * @tc.desc   BreakpointType<number> triple (59,913,9767) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0059 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(59, 913, 9767);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(59));
      expect(r0).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(913));
      expect(r1).assertEqual(913);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9767));
      expect(r2).assertEqual(9767);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0059 end');
    });

    /**
     * @tc.name   testBpNumVol0060
     * @tc.number SUB_MC_BPG_0060
     * @tc.desc   BreakpointType<number> triple (60,920,9780) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0060 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(60, 920, 9780);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(60));
      expect(r0).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(920));
      expect(r1).assertEqual(920);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9780));
      expect(r2).assertEqual(9780);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0060 end');
    });

    /**
     * @tc.name   testBpNumVol0061
     * @tc.number SUB_MC_BPG_0061
     * @tc.desc   BreakpointType<number> triple (61,927,9793) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0061 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(61, 927, 9793);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(61));
      expect(r0).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(927));
      expect(r1).assertEqual(927);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9793));
      expect(r2).assertEqual(9793);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0061 end');
    });

    /**
     * @tc.name   testBpNumVol0062
     * @tc.number SUB_MC_BPG_0062
     * @tc.desc   BreakpointType<number> triple (62,934,9806) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0062 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(62, 934, 9806);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(62));
      expect(r0).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(934));
      expect(r1).assertEqual(934);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9806));
      expect(r2).assertEqual(9806);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0062 end');
    });

    /**
     * @tc.name   testBpNumVol0063
     * @tc.number SUB_MC_BPG_0063
     * @tc.desc   BreakpointType<number> triple (63,941,9819) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0063 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(63, 941, 9819);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(63));
      expect(r0).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(941));
      expect(r1).assertEqual(941);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9819));
      expect(r2).assertEqual(9819);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0063 end');
    });

    /**
     * @tc.name   testBpNumVol0064
     * @tc.number SUB_MC_BPG_0064
     * @tc.desc   BreakpointType<number> triple (64,948,9832) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0064 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(64, 948, 9832);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(64));
      expect(r0).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(948));
      expect(r1).assertEqual(948);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9832));
      expect(r2).assertEqual(9832);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0064 end');
    });

    /**
     * @tc.name   testBpNumVol0065
     * @tc.number SUB_MC_BPG_0065
     * @tc.desc   BreakpointType<number> triple (65,955,9845) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0065 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(65, 955, 9845);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(65));
      expect(r0).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(955));
      expect(r1).assertEqual(955);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9845));
      expect(r2).assertEqual(9845);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0065 end');
    });

    /**
     * @tc.name   testBpNumVol0066
     * @tc.number SUB_MC_BPG_0066
     * @tc.desc   BreakpointType<number> triple (66,962,9858) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0066 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(66, 962, 9858);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(66));
      expect(r0).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(962));
      expect(r1).assertEqual(962);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9858));
      expect(r2).assertEqual(9858);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0066 end');
    });

    /**
     * @tc.name   testBpNumVol0067
     * @tc.number SUB_MC_BPG_0067
     * @tc.desc   BreakpointType<number> triple (67,969,9871) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0067 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(67, 969, 9871);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(67));
      expect(r0).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(969));
      expect(r1).assertEqual(969);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9871));
      expect(r2).assertEqual(9871);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0067 end');
    });

    /**
     * @tc.name   testBpNumVol0068
     * @tc.number SUB_MC_BPG_0068
     * @tc.desc   BreakpointType<number> triple (68,976,9884) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0068 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(68, 976, 9884);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(68));
      expect(r0).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(976));
      expect(r1).assertEqual(976);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9884));
      expect(r2).assertEqual(9884);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0068 end');
    });

    /**
     * @tc.name   testBpNumVol0069
     * @tc.number SUB_MC_BPG_0069
     * @tc.desc   BreakpointType<number> triple (69,983,9897) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0069 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(69, 983, 9897);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(69));
      expect(r0).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(983));
      expect(r1).assertEqual(983);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9897));
      expect(r2).assertEqual(9897);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0069 end');
    });

    /**
     * @tc.name   testBpNumVol0070
     * @tc.number SUB_MC_BPG_0070
     * @tc.desc   BreakpointType<number> triple (70,990,9910) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0070 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(70, 990, 9910);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(70));
      expect(r0).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(990));
      expect(r1).assertEqual(990);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9910));
      expect(r2).assertEqual(9910);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0070 end');
    });

    /**
     * @tc.name   testBpNumVol0071
     * @tc.number SUB_MC_BPG_0071
     * @tc.desc   BreakpointType<number> triple (71,997,9923) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0071 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(71, 997, 9923);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(71));
      expect(r0).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(997));
      expect(r1).assertEqual(997);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9923));
      expect(r2).assertEqual(9923);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0071 end');
    });

    /**
     * @tc.name   testBpNumVol0072
     * @tc.number SUB_MC_BPG_0072
     * @tc.desc   BreakpointType<number> triple (72,1004,9936) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0072 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(72, 1004, 9936);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(72));
      expect(r0).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1004));
      expect(r1).assertEqual(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9936));
      expect(r2).assertEqual(9936);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0072 end');
    });

    /**
     * @tc.name   testBpNumVol0073
     * @tc.number SUB_MC_BPG_0073
     * @tc.desc   BreakpointType<number> triple (73,1011,9949) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0073 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(73, 1011, 9949);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(73));
      expect(r0).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1011));
      expect(r1).assertEqual(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9949));
      expect(r2).assertEqual(9949);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0073 end');
    });

    /**
     * @tc.name   testBpNumVol0074
     * @tc.number SUB_MC_BPG_0074
     * @tc.desc   BreakpointType<number> triple (74,1018,9962) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0074 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(74, 1018, 9962);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(74));
      expect(r0).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1018));
      expect(r1).assertEqual(1018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9962));
      expect(r2).assertEqual(9962);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0074 end');
    });

    /**
     * @tc.name   testBpNumVol0075
     * @tc.number SUB_MC_BPG_0075
     * @tc.desc   BreakpointType<number> triple (75,1025,9975) resolves sm/md/lg by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpNumVol0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0075 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(75, 1025, 9975);
      const r0: number = sut.GetValue('sm') as number;
      const r1: number = sut.GetValue('md') as number;
      const r2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(75));
      expect(r0).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1025));
      expect(r1).assertEqual(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9975));
      expect(r2).assertEqual(9975);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpNumVol0075 end');
    });

  });
}
