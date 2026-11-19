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

// @volume rule=BreakpointType<Array<number>> frozen triples -> GetValue returns exact array basis=main-frozen cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPA1]';

export default function bpArrVol01Test() {
  describe('MultiColumnsBpArrVol01', () => {

    /**
     * @tc.name   testBpArrVol0401
     * @tc.number SUB_MC_BPG_0401
     * @tc.desc   Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0401 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([] as Array<number>),
        ([100] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0401 end');
    });

    /**
     * @tc.name   testBpArrVol0402
     * @tc.number SUB_MC_BPG_0402
     * @tc.desc   Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0402 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([] as Array<number>),
        ([100] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0402 end');
    });

    /**
     * @tc.name   testBpArrVol0403
     * @tc.number SUB_MC_BPG_0403
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0403 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0403 end');
    });

    /**
     * @tc.name   testBpArrVol0404
     * @tc.number SUB_MC_BPG_0404
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0404 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0404 end');
    });

    /**
     * @tc.name   testBpArrVol0405
     * @tc.number SUB_MC_BPG_0405
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0405 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0405 end');
    });

    /**
     * @tc.name   testBpArrVol0406
     * @tc.number SUB_MC_BPG_0406
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0406 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0406 end');
    });

    /**
     * @tc.name   testBpArrVol0407
     * @tc.number SUB_MC_BPG_0407
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0407 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0407 end');
    });

    /**
     * @tc.name   testBpArrVol0408
     * @tc.number SUB_MC_BPG_0408
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0408 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0408 end');
    });

    /**
     * @tc.name   testBpArrVol0409
     * @tc.number SUB_MC_BPG_0409
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0409 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0409 end');
    });

    /**
     * @tc.name   testBpArrVol0410
     * @tc.number SUB_MC_BPG_0410
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0410 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0410 end');
    });

    /**
     * @tc.name   testBpArrVol0411
     * @tc.number SUB_MC_BPG_0411
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0411 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0411 end');
    });

    /**
     * @tc.name   testBpArrVol0412
     * @tc.number SUB_MC_BPG_0412
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0412 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0412 end');
    });

    /**
     * @tc.name   testBpArrVol0413
     * @tc.number SUB_MC_BPG_0413
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0413 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0413 end');
    });

    /**
     * @tc.name   testBpArrVol0414
     * @tc.number SUB_MC_BPG_0414
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0414 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0414 end');
    });

    /**
     * @tc.name   testBpArrVol0415
     * @tc.number SUB_MC_BPG_0415
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0415 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0415 end');
    });

    /**
     * @tc.name   testBpArrVol0416
     * @tc.number SUB_MC_BPG_0416
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0416 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0416 end');
    });

    /**
     * @tc.name   testBpArrVol0417
     * @tc.number SUB_MC_BPG_0417
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0417 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0417 end');
    });

    /**
     * @tc.name   testBpArrVol0418
     * @tc.number SUB_MC_BPG_0418
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0418 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0418 end');
    });

    /**
     * @tc.name   testBpArrVol0419
     * @tc.number SUB_MC_BPG_0419
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0419 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0419 end');
    });

    /**
     * @tc.name   testBpArrVol0420
     * @tc.number SUB_MC_BPG_0420
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0420 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0420 end');
    });

    /**
     * @tc.name   testBpArrVol0421
     * @tc.number SUB_MC_BPG_0421
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0421 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0421 end');
    });

    /**
     * @tc.name   testBpArrVol0422
     * @tc.number SUB_MC_BPG_0422
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0422 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0422 end');
    });

    /**
     * @tc.name   testBpArrVol0423
     * @tc.number SUB_MC_BPG_0423
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0423 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0423 end');
    });

    /**
     * @tc.name   testBpArrVol0424
     * @tc.number SUB_MC_BPG_0424
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0424 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0424 end');
    });

    /**
     * @tc.name   testBpArrVol0425
     * @tc.number SUB_MC_BPG_0425
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0425 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0425 end');
    });

    /**
     * @tc.name   testBpArrVol0426
     * @tc.number SUB_MC_BPG_0426
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0426 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0426 end');
    });

    /**
     * @tc.name   testBpArrVol0427
     * @tc.number SUB_MC_BPG_0427
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0427 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0427 end');
    });

    /**
     * @tc.name   testBpArrVol0428
     * @tc.number SUB_MC_BPG_0428
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0428 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0428 end');
    });

    /**
     * @tc.name   testBpArrVol0429
     * @tc.number SUB_MC_BPG_0429
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0429 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0429 end');
    });

    /**
     * @tc.name   testBpArrVol0430
     * @tc.number SUB_MC_BPG_0430
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0430 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0430 end');
    });

    /**
     * @tc.name   testBpArrVol0431
     * @tc.number SUB_MC_BPG_0431
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0431 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0431 end');
    });

    /**
     * @tc.name   testBpArrVol0432
     * @tc.number SUB_MC_BPG_0432
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0432 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0432 end');
    });

    /**
     * @tc.name   testBpArrVol0433
     * @tc.number SUB_MC_BPG_0433
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0433 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0433 end');
    });

    /**
     * @tc.name   testBpArrVol0434
     * @tc.number SUB_MC_BPG_0434
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0434 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0434 end');
    });

    /**
     * @tc.name   testBpArrVol0435
     * @tc.number SUB_MC_BPG_0435
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0435 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0435 end');
    });

    /**
     * @tc.name   testBpArrVol0436
     * @tc.number SUB_MC_BPG_0436
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0436 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0436 end');
    });

    /**
     * @tc.name   testBpArrVol0437
     * @tc.number SUB_MC_BPG_0437
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0437 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0437 end');
    });

    /**
     * @tc.name   testBpArrVol0438
     * @tc.number SUB_MC_BPG_0438
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0438 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0438 end');
    });

    /**
     * @tc.name   testBpArrVol0439
     * @tc.number SUB_MC_BPG_0439
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0439 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0439 end');
    });

    /**
     * @tc.name   testBpArrVol0440
     * @tc.number SUB_MC_BPG_0440
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0440 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0440 end');
    });

    /**
     * @tc.name   testBpArrVol0441
     * @tc.number SUB_MC_BPG_0441
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0441 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0441 end');
    });

    /**
     * @tc.name   testBpArrVol0442
     * @tc.number SUB_MC_BPG_0442
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0442 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0442 end');
    });

    /**
     * @tc.name   testBpArrVol0443
     * @tc.number SUB_MC_BPG_0443
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0443 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0443 end');
    });

    /**
     * @tc.name   testBpArrVol0444
     * @tc.number SUB_MC_BPG_0444
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0444 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0444 end');
    });

    /**
     * @tc.name   testBpArrVol0445
     * @tc.number SUB_MC_BPG_0445
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0445 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0445 end');
    });

    /**
     * @tc.name   testBpArrVol0446
     * @tc.number SUB_MC_BPG_0446
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0446 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0446 end');
    });

    /**
     * @tc.name   testBpArrVol0447
     * @tc.number SUB_MC_BPG_0447
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0447 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0447 end');
    });

    /**
     * @tc.name   testBpArrVol0448
     * @tc.number SUB_MC_BPG_0448
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0448 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0448 end');
    });

    /**
     * @tc.name   testBpArrVol0449
     * @tc.number SUB_MC_BPG_0449
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0449 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0449 end');
    });

    /**
     * @tc.name   testBpArrVol0450
     * @tc.number SUB_MC_BPG_0450
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0450 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0450 end');
    });

    /**
     * @tc.name   testBpArrVol0451
     * @tc.number SUB_MC_BPG_0451
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0451 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0451 end');
    });

    /**
     * @tc.name   testBpArrVol0452
     * @tc.number SUB_MC_BPG_0452
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0452 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0452 end');
    });

    /**
     * @tc.name   testBpArrVol0453
     * @tc.number SUB_MC_BPG_0453
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0453 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0453 end');
    });

    /**
     * @tc.name   testBpArrVol0454
     * @tc.number SUB_MC_BPG_0454
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0454 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0454 end');
    });

    /**
     * @tc.name   testBpArrVol0455
     * @tc.number SUB_MC_BPG_0455
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0455 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0455 end');
    });

    /**
     * @tc.name   testBpArrVol0456
     * @tc.number SUB_MC_BPG_0456
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0456 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0456 end');
    });

    /**
     * @tc.name   testBpArrVol0457
     * @tc.number SUB_MC_BPG_0457
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0457 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0457 end');
    });

    /**
     * @tc.name   testBpArrVol0458
     * @tc.number SUB_MC_BPG_0458
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0458 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0458 end');
    });

    /**
     * @tc.name   testBpArrVol0459
     * @tc.number SUB_MC_BPG_0459
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0459 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0459 end');
    });

    /**
     * @tc.name   testBpArrVol0460
     * @tc.number SUB_MC_BPG_0460
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0460 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0460 end');
    });

    /**
     * @tc.name   testBpArrVol0461
     * @tc.number SUB_MC_BPG_0461
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0461 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0461 end');
    });

    /**
     * @tc.name   testBpArrVol0462
     * @tc.number SUB_MC_BPG_0462
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0462 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0462 end');
    });

    /**
     * @tc.name   testBpArrVol0463
     * @tc.number SUB_MC_BPG_0463
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0463 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0463 end');
    });

    /**
     * @tc.name   testBpArrVol0464
     * @tc.number SUB_MC_BPG_0464
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0464 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0464 end');
    });

    /**
     * @tc.name   testBpArrVol0465
     * @tc.number SUB_MC_BPG_0465
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0465 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0465 end');
    });

    /**
     * @tc.name   testBpArrVol0466
     * @tc.number SUB_MC_BPG_0466
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0466 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0466 end');
    });

    /**
     * @tc.name   testBpArrVol0467
     * @tc.number SUB_MC_BPG_0467
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0467 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0467 end');
    });

    /**
     * @tc.name   testBpArrVol0468
     * @tc.number SUB_MC_BPG_0468
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0468 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0468 end');
    });

    /**
     * @tc.name   testBpArrVol0469
     * @tc.number SUB_MC_BPG_0469
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0469 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0469 end');
    });

    /**
     * @tc.name   testBpArrVol0470
     * @tc.number SUB_MC_BPG_0470
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0470 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0470 end');
    });

    /**
     * @tc.name   testBpArrVol0471
     * @tc.number SUB_MC_BPG_0471
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0471 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0471 end');
    });

    /**
     * @tc.name   testBpArrVol0472
     * @tc.number SUB_MC_BPG_0472
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0472 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1] as Array<number>),
        ([100, 101] as Array<number>),
        ([500, 501, 502] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0472 end');
    });

    /**
     * @tc.name   testBpArrVol0473
     * @tc.number SUB_MC_BPG_0473
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0473 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2] as Array<number>),
        ([100, 101, 102] as Array<number>),
        ([500, 501, 502, 503] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0473 end');
    });

    /**
     * @tc.name   testBpArrVol0474
     * @tc.number SUB_MC_BPG_0474
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0474 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3] as Array<number>),
        ([100, 101, 102, 103] as Array<number>),
        ([500, 501, 502, 503, 504] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0474 end');
    });

    /**
     * @tc.name   testBpArrVol0475
     * @tc.number SUB_MC_BPG_0475
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0475 begin');
      const sut: BreakpointType<Array<number>> = new BreakpointType<Array<number>>(
        ([1, 2, 3, 4] as Array<number>),
        ([100, 101, 102, 103, 104] as Array<number>),
        ([500, 501, 502, 503, 504, 505] as Array<number>));
      const r0: Array<number> = sut.GetValue('sm') as Array<number>;
      const r1: Array<number> = sut.GetValue('md') as Array<number>;
      const r2: Array<number> = sut.GetValue('lg') as Array<number>;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smJoin=%{public}s', r0.join(','));
      expect(r0.join(",")).assertEqual('1,2,3,4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mdJoin=%{public}s', r1.join(','));
      expect(r1.join(",")).assertEqual('100,101,102,103,104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'lgLen=%{public}s', String(r2.length));
      expect(r2.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0475 end');
    });

  });
}
