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

// @volume rule=GetValue unknown key -> undefined
// (bounded default-branch coverage with positive control) basis=spec cases=60
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPI]';

export default function bpInvVol01Test() {
  describe('MultiColumnsBpInvVol01', () => {

    /**
     * @tc.name   testBpInvVol0001
     * @tc.number SUB_MC_BPI_0001
     * @tc.desc   Anchor: GetValue('') near-miss must not leak a breakpoint value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0001 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0001 end');
    });

    /**
     * @tc.name   testBpInvVol0002
     * @tc.number SUB_MC_BPI_0002
     * @tc.desc   Anchor: GetValue('SM') near-miss must not leak a breakpoint value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0002 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0002 end');
    });

    /**
     * @tc.name   testBpInvVol0003
     * @tc.number SUB_MC_BPI_0003
     * @tc.desc   GetValue('MD') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0003 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('MD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0003 end');
    });

    /**
     * @tc.name   testBpInvVol0004
     * @tc.number SUB_MC_BPI_0004
     * @tc.desc   GetValue('LG') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0004 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('LG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0004 end');
    });

    /**
     * @tc.name   testBpInvVol0005
     * @tc.number SUB_MC_BPI_0005
     * @tc.desc   GetValue('Sm') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0005 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('Sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0005 end');
    });

    /**
     * @tc.name   testBpInvVol0006
     * @tc.number SUB_MC_BPI_0006
     * @tc.desc   GetValue('M d') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0006 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('M d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0006 end');
    });

    /**
     * @tc.name   testBpInvVol0007
     * @tc.number SUB_MC_BPI_0007
     * @tc.desc   GetValue('l g') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0007 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('l g');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0007 end');
    });

    /**
     * @tc.name   testBpInvVol0008
     * @tc.number SUB_MC_BPI_0008
     * @tc.desc   GetValue('sm ') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0008 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sm ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0008 end');
    });

    /**
     * @tc.name   testBpInvVol0009
     * @tc.number SUB_MC_BPI_0009
     * @tc.desc   GetValue(' md') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0009 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue(' md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0009 end');
    });

    /**
     * @tc.name   testBpInvVol0010
     * @tc.number SUB_MC_BPI_0010
     * @tc.desc   GetValue('lgx') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0010 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lgx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0010 end');
    });

    /**
     * @tc.name   testBpInvVol0011
     * @tc.number SUB_MC_BPI_0011
     * @tc.desc   GetValue('xsm') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0011 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('xsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0011 end');
    });

    /**
     * @tc.name   testBpInvVol0012
     * @tc.number SUB_MC_BPI_0012
     * @tc.desc   GetValue('s') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0012 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0012 end');
    });

    /**
     * @tc.name   testBpInvVol0013
     * @tc.number SUB_MC_BPI_0013
     * @tc.desc   GetValue('m') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0013 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('m');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0013 end');
    });

    /**
     * @tc.name   testBpInvVol0014
     * @tc.number SUB_MC_BPI_0014
     * @tc.desc   GetValue('l') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0014 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0014 end');
    });

    /**
     * @tc.name   testBpInvVol0015
     * @tc.number SUB_MC_BPI_0015
     * @tc.desc   GetValue('small') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0015 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('small');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0015 end');
    });

    /**
     * @tc.name   testBpInvVol0016
     * @tc.number SUB_MC_BPI_0016
     * @tc.desc   GetValue('medium') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0016 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('medium');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0016 end');
    });

    /**
     * @tc.name   testBpInvVol0017
     * @tc.number SUB_MC_BPI_0017
     * @tc.desc   GetValue('large') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0017 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('large');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0017 end');
    });

    /**
     * @tc.name   testBpInvVol0018
     * @tc.number SUB_MC_BPI_0018
     * @tc.desc   GetValue('xs') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0018 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0018 end');
    });

    /**
     * @tc.name   testBpInvVol0019
     * @tc.number SUB_MC_BPI_0019
     * @tc.desc   GetValue('xl') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0019 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0019 end');
    });

    /**
     * @tc.name   testBpInvVol0020
     * @tc.number SUB_MC_BPI_0020
     * @tc.desc   GetValue('xxl') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0020 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('xxl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0020 end');
    });

    /**
     * @tc.name   testBpInvVol0021
     * @tc.number SUB_MC_BPI_0021
     * @tc.desc   GetValue('tablet') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0021 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('tablet');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0021 end');
    });

    /**
     * @tc.name   testBpInvVol0022
     * @tc.number SUB_MC_BPI_0022
     * @tc.desc   GetValue('desktop') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0022 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('desktop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0022 end');
    });

    /**
     * @tc.name   testBpInvVol0023
     * @tc.number SUB_MC_BPI_0023
     * @tc.desc   GetValue('phone') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0023 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('phone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0023 end');
    });

    /**
     * @tc.name   testBpInvVol0024
     * @tc.number SUB_MC_BPI_0024
     * @tc.desc   GetValue('tv') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0024 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('tv');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0024 end');
    });

    /**
     * @tc.name   testBpInvVol0025
     * @tc.number SUB_MC_BPI_0025
     * @tc.desc   GetValue('wearable') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0025 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('wearable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0025 end');
    });

    /**
     * @tc.name   testBpInvVol0026
     * @tc.number SUB_MC_BPI_0026
     * @tc.desc   GetValue('0') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0026 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0026 end');
    });

    /**
     * @tc.name   testBpInvVol0027
     * @tc.number SUB_MC_BPI_0027
     * @tc.desc   GetValue('1') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0027 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0027 end');
    });

    /**
     * @tc.name   testBpInvVol0028
     * @tc.number SUB_MC_BPI_0028
     * @tc.desc   GetValue('2') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0028 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0028 end');
    });

    /**
     * @tc.name   testBpInvVol0029
     * @tc.number SUB_MC_BPI_0029
     * @tc.desc   GetValue('3') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0029 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0029 end');
    });

    /**
     * @tc.name   testBpInvVol0030
     * @tc.number SUB_MC_BPI_0030
     * @tc.desc   GetValue('-1') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0030 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0030 end');
    });

    /**
     * @tc.name   testBpInvVol0031
     * @tc.number SUB_MC_BPI_0031
     * @tc.desc   GetValue('sm\t') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0031 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sm\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0031 end');
    });

    /**
     * @tc.name   testBpInvVol0032
     * @tc.number SUB_MC_BPI_0032
     * @tc.desc   GetValue('md\n') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0032 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('md\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0032 end');
    });

    /**
     * @tc.name   testBpInvVol0033
     * @tc.number SUB_MC_BPI_0033
     * @tc.desc   GetValue('lg ') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0033 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0033 end');
    });

    /**
     * @tc.name   testBpInvVol0034
     * @tc.number SUB_MC_BPI_0034
     * @tc.desc   GetValue('SMALL') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0034 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('SMALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0034 end');
    });

    /**
     * @tc.name   testBpInvVol0035
     * @tc.number SUB_MC_BPI_0035
     * @tc.desc   GetValue('Medium') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0035 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('Medium');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0035 end');
    });

    /**
     * @tc.name   testBpInvVol0036
     * @tc.number SUB_MC_BPI_0036
     * @tc.desc   GetValue('LARGE') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0036 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('LARGE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0036 end');
    });

    /**
     * @tc.name   testBpInvVol0037
     * @tc.number SUB_MC_BPI_0037
     * @tc.desc   GetValue('sm-') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0037 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sm-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0037 end');
    });

    /**
     * @tc.name   testBpInvVol0038
     * @tc.number SUB_MC_BPI_0038
     * @tc.desc   GetValue('_md') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0038 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('_md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0038 end');
    });

    /**
     * @tc.name   testBpInvVol0039
     * @tc.number SUB_MC_BPI_0039
     * @tc.desc   GetValue('lg_lg') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0039 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lg_lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0039 end');
    });

    /**
     * @tc.name   testBpInvVol0040
     * @tc.number SUB_MC_BPI_0040
     * @tc.desc   GetValue('smsm') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0040 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('smsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0040 end');
    });

    /**
     * @tc.name   testBpInvVol0041
     * @tc.number SUB_MC_BPI_0041
     * @tc.desc   GetValue('mdmd') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0041 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('mdmd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0041 end');
    });

    /**
     * @tc.name   testBpInvVol0042
     * @tc.number SUB_MC_BPI_0042
     * @tc.desc   GetValue('lglg') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0042 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lglg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0042 end');
    });

    /**
     * @tc.name   testBpInvVol0043
     * @tc.number SUB_MC_BPI_0043
     * @tc.desc   GetValue(' sm') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0043 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0043 end');
    });

    /**
     * @tc.name   testBpInvVol0044
     * @tc.number SUB_MC_BPI_0044
     * @tc.desc   GetValue('md ') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0044 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('md ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0044 end');
    });

    /**
     * @tc.name   testBpInvVol0045
     * @tc.number SUB_MC_BPI_0045
     * @tc.desc   GetValue('sM') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0045 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0045 end');
    });

    /**
     * @tc.name   testBpInvVol0046
     * @tc.number SUB_MC_BPI_0046
     * @tc.desc   GetValue('mD') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0046 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('mD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0046 end');
    });

    /**
     * @tc.name   testBpInvVol0047
     * @tc.number SUB_MC_BPI_0047
     * @tc.desc   GetValue('lG') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0047 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0047 end');
    });

    /**
     * @tc.name   testBpInvVol0048
     * @tc.number SUB_MC_BPI_0048
     * @tc.desc   GetValue('zz') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0048 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('zz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0048 end');
    });

    /**
     * @tc.name   testBpInvVol0049
     * @tc.number SUB_MC_BPI_0049
     * @tc.desc   GetValue('2.5') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0049 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('2.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0049 end');
    });

    /**
     * @tc.name   testBpInvVol0050
     * @tc.number SUB_MC_BPI_0050
     * @tc.desc   GetValue('NaN') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0050 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('NaN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0050 end');
    });

    /**
     * @tc.name   testBpInvVol0051
     * @tc.number SUB_MC_BPI_0051
     * @tc.desc   GetValue('Infinity') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0051 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('Infinity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0051 end');
    });

    /**
     * @tc.name   testBpInvVol0052
     * @tc.number SUB_MC_BPI_0052
     * @tc.desc   GetValue('0x1') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0052 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('0x1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0052 end');
    });

    /**
     * @tc.name   testBpInvVol0053
     * @tc.number SUB_MC_BPI_0053
     * @tc.desc   GetValue('sm/md') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0053 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sm/md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0053 end');
    });

    /**
     * @tc.name   testBpInvVol0054
     * @tc.number SUB_MC_BPI_0054
     * @tc.desc   GetValue('md-lg') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0054 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('md-lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0054 end');
    });

    /**
     * @tc.name   testBpInvVol0055
     * @tc.number SUB_MC_BPI_0055
     * @tc.desc   GetValue('a') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0055 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0055 end');
    });

    /**
     * @tc.name   testBpInvVol0056
     * @tc.number SUB_MC_BPI_0056
     * @tc.desc   GetValue('z') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0056 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0056 end');
    });

    /**
     * @tc.name   testBpInvVol0057
     * @tc.number SUB_MC_BPI_0057
     * @tc.desc   GetValue('mdmdmd') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0057 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('mdmdmd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0057 end');
    });

    /**
     * @tc.name   testBpInvVol0058
     * @tc.number SUB_MC_BPI_0058
     * @tc.desc   GetValue('sm:') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0058 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('sm:');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0058 end');
    });

    /**
     * @tc.name   testBpInvVol0059
     * @tc.number SUB_MC_BPI_0059
     * @tc.desc   GetValue('lg;') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0059 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('lg;');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0059 end');
    });

    /**
     * @tc.name   testBpInvVol0060
     * @tc.number SUB_MC_BPI_0060
     * @tc.desc   GetValue('bad_key_59') is not a known key so it yields undefined while sm/lg stay intact
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpInvVol0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0060 begin');
      const sut: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      const r: number | undefined = sut.GetValue('bad_key_59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unknown key result=%{public}s', String(r));
      expect(r).assertUndefined();
      const ok1: number = sut.GetValue('sm') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(ok1));
      expect(ok1).assertEqual(10);
      const ok2: number = sut.GetValue('lg') as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=30', String(ok2));
      expect(ok2).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpInvVol0060 end');
    });

  });
}
