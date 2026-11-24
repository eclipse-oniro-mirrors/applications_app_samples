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

// @volume rule=BreakpointType<Array<number>> frozen triples -> GetValue returns exact array basis=main-frozen cases=25
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPA2]';

export default function bpArrVol02Test() {
  describe('MultiColumnsBpArrVol02', () => {

    /**
     * @tc.name   testBpArrVol0476
     * @tc.number SUB_MC_BPG_0476
     * @tc.desc   Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0476 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0476 end');
    });

    /**
     * @tc.name   testBpArrVol0477
     * @tc.number SUB_MC_BPG_0477
     * @tc.desc   Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays by key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0477 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0477 end');
    });

    /**
     * @tc.name   testBpArrVol0478
     * @tc.number SUB_MC_BPG_0478
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0478 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0478 end');
    });

    /**
     * @tc.name   testBpArrVol0479
     * @tc.number SUB_MC_BPG_0479
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0479 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0479 end');
    });

    /**
     * @tc.name   testBpArrVol0480
     * @tc.number SUB_MC_BPG_0480
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0480 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0480 end');
    });

    /**
     * @tc.name   testBpArrVol0481
     * @tc.number SUB_MC_BPG_0481
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0481 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0481 end');
    });

    /**
     * @tc.name   testBpArrVol0482
     * @tc.number SUB_MC_BPG_0482
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0482 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0482 end');
    });

    /**
     * @tc.name   testBpArrVol0483
     * @tc.number SUB_MC_BPG_0483
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0483 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0483 end');
    });

    /**
     * @tc.name   testBpArrVol0484
     * @tc.number SUB_MC_BPG_0484
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0484 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0484 end');
    });

    /**
     * @tc.name   testBpArrVol0485
     * @tc.number SUB_MC_BPG_0485
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0485 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0485 end');
    });

    /**
     * @tc.name   testBpArrVol0486
     * @tc.number SUB_MC_BPG_0486
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0486 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0486 end');
    });

    /**
     * @tc.name   testBpArrVol0487
     * @tc.number SUB_MC_BPG_0487
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0487 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0487 end');
    });

    /**
     * @tc.name   testBpArrVol0488
     * @tc.number SUB_MC_BPG_0488
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0488 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0488 end');
    });

    /**
     * @tc.name   testBpArrVol0489
     * @tc.number SUB_MC_BPG_0489
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0489 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0489 end');
    });

    /**
     * @tc.name   testBpArrVol0490
     * @tc.number SUB_MC_BPG_0490
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0490 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0490 end');
    });

    /**
     * @tc.name   testBpArrVol0491
     * @tc.number SUB_MC_BPG_0491
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0491 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0491 end');
    });

    /**
     * @tc.name   testBpArrVol0492
     * @tc.number SUB_MC_BPG_0492
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0492 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0492 end');
    });

    /**
     * @tc.name   testBpArrVol0493
     * @tc.number SUB_MC_BPG_0493
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0493 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0493 end');
    });

    /**
     * @tc.name   testBpArrVol0494
     * @tc.number SUB_MC_BPG_0494
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0494 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0494 end');
    });

    /**
     * @tc.name   testBpArrVol0495
     * @tc.number SUB_MC_BPG_0495
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0495 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0495 end');
    });

    /**
     * @tc.name   testBpArrVol0496
     * @tc.number SUB_MC_BPG_0496
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0496 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0496 end');
    });

    /**
     * @tc.name   testBpArrVol0497
     * @tc.number SUB_MC_BPG_0497
     * @tc.desc   BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0497 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0497 end');
    });

    /**
     * @tc.name   testBpArrVol0498
     * @tc.number SUB_MC_BPG_0498
     * @tc.desc   BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0498 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0498 end');
    });

    /**
     * @tc.name   testBpArrVol0499
     * @tc.number SUB_MC_BPG_0499
     * @tc.desc   BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0499 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0499 end');
    });

    /**
     * @tc.name   testBpArrVol0500
     * @tc.number SUB_MC_BPG_0500
     * @tc.desc   BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpArrVol0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0500 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpArrVol0500 end');
    });

  });
}
