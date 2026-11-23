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

/**
 * Hand written showcase suite for the combination and state dimension of
 * MyDataSource. It picks inputs that RealDataCore01 does not use, so the two
 * suites never assert the same snapshot twice:
 *   - insertion positions that need clamping (>= length, negative from the
 *     tail) are checked for both the landing position and the echoed index;
 *   - push loops are checked for the final tail id and the last notified
 *     index, which must stay consistent with the grown length;
 *   - notification counters are checked with 0, 1, 2, 3 and 4 registered
 *     listeners, plus the full range of forwarded indices.
 */
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  runDataSourceAdd,
  runDataSourceIndex,
  runDataSourceMixed,
  runDataSourcePush,
  runListenerNotify
} from '../util/DataSourceProbe';
import { SONG_COUNT, runSongStats } from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';
const MAX_INDEX: string = '9007199254740991';

export default function realEdge01Test(): void {
  describe('RealEdge01Test', () => {

    /*
     * @tc.number: SUB_REAL_EDGE_01_0100
     * @tc.name: testEdgeReal0001
     * @tc.desc: Verify addData(100) lands on the tail yet echoes the raw index
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0001', 0, async (done: Function) => {
      await runCase('testEdgeReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0001 begin');
        const actual: string = runDataSourceAdd(3, 100);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|3|100');
        logAssertion(DOMAIN, TAG, String(actual), String('4|3|100'));
        expect(actual).assertEqual('4|3|100');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('3'));
        expect(actual.split('|')[1]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('100'));
        expect(actual.split('|')[2]).assertEqual('100');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0200
     * @tc.name: testEdgeReal0002
     * @tc.desc: Verify addData(0) shifts a four row seed and lands on the head
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0002', 0, async (done: Function) => {
      await runCase('testEdgeReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0002 begin');
        const actual: string = runDataSourceAdd(4, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('5|0|0'));
        expect(actual).assertEqual('5|0|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('5'));
        expect(actual.split('|')[0]).assertEqual('5');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(actual.split('|')[2]));
        expect(actual.split('|')[1]).assertEqual(actual.split('|')[2]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0300
     * @tc.name: testEdgeReal0003
     * @tc.desc: Verify addData at exactly totalCount appends without clamping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0003', 0, async (done: Function) => {
      await runCase('testEdgeReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0003 begin');
        const actual: string = runDataSourceAdd(4, 4);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|4|4');
        logAssertion(DOMAIN, TAG, String(actual), String('5|4|4'));
        expect(actual).assertEqual('5|4|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('4'));
        expect(actual.split('|')[1]).assertEqual('4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(actual.split('|')[2]));
        expect(actual.split('|')[1]).assertEqual(actual.split('|')[2]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0400
     * @tc.name: testEdgeReal0004
     * @tc.desc: Verify addData(-2) inserts before the last two rows and echoes -2
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0004', 0, async (done: Function) => {
      await runCase('testEdgeReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0004 begin');
        const actual: string = runDataSourceAdd(5, -2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '6|3|-2');
        logAssertion(DOMAIN, TAG, String(actual), String('6|3|-2'));
        expect(actual).assertEqual('6|3|-2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('3'));
        expect(actual.split('|')[1]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('-2'));
        expect(actual.split('|')[2]).assertEqual('-2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0500
     * @tc.name: testEdgeReal0005
     * @tc.desc: Verify a single row seed grows to two rows on a head insertion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0005', 0, async (done: Function) => {
      await runCase('testEdgeReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0005 begin');
        const actual: string = runDataSourceAdd(1, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('2|0|0'));
        expect(actual).assertEqual('2|0|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('2'));
        expect(actual.split('|')[0]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('2|0|')), 'true');
        expect(actual.startsWith('2|0|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0600
     * @tc.name: testEdgeReal0006
     * @tc.desc: Verify a single row seed grows to two rows on a tail insertion
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0006', 0, async (done: Function) => {
      await runCase('testEdgeReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0006 begin');
        const actual: string = runDataSourceAdd(1, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|1|1');
        logAssertion(DOMAIN, TAG, String(actual), String('2|1|1'));
        expect(actual).assertEqual('2|1|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('2'));
        expect(actual.split('|')[0]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0700
     * @tc.name: testEdgeReal0007
     * @tc.desc: Verify two pushes on one row report tail 9101 and index 2
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0007', 0, async (done: Function) => {
      await runCase('testEdgeReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0007 begin');
        const actual: string = runDataSourcePush(1, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9101|2|2');
        logAssertion(DOMAIN, TAG, String(actual), String('3|9101|2|2'));
        expect(actual).assertEqual('3|9101|2|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('2'));
        expect(actual.split('|')[2]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('2'));
        expect(actual.split('|')[3]).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0800
     * @tc.name: testEdgeReal0008
     * @tc.desc: Verify four pushes on three rows report last index 6
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0008', 0, async (done: Function) => {
      await runCase('testEdgeReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0008 begin');
        const actual: string = runDataSourcePush(3, 4);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7|9103|4|6');
        logAssertion(DOMAIN, TAG, String(actual), String('7|9103|4|6'));
        expect(actual).assertEqual('7|9103|4|6');
        logAssertion(DOMAIN, TAG, String(Number(actual.split('|')[0]) - 3), String(4));
        expect(Number(actual.split('|')[0]) - 3).assertEqual(4);
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('6'));
        expect(actual.split('|')[3]).assertEqual('6');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_0900
     * @tc.name: testEdgeReal0009
     * @tc.desc: Verify three pushes on an empty seed grow the source to three rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0009', 0, async (done: Function) => {
      await runCase('testEdgeReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0009 begin');
        const actual: string = runDataSourcePush(0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9102|3|2');
        logAssertion(DOMAIN, TAG, String(actual), String('3|9102|3|2'));
        expect(actual).assertEqual('3|9102|3|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9102'));
        expect(actual.split('|')[1]).assertEqual('9102');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String(actual.split('|')[0]));
        expect(actual.split('|')[2]).assertEqual(actual.split('|')[0]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1000
     * @tc.name: testEdgeReal0010
     * @tc.desc: Verify a push on a 24 row seed reports 25 rows and index 24
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0010', 0, async (done: Function) => {
      await runCase('testEdgeReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0010 begin');
        const actual: string = runDataSourcePush(24, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '25|9100|1|24');
        logAssertion(DOMAIN, TAG, String(actual), String('25|9100|1|24'));
        expect(actual).assertEqual('25|9100|1|24');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('24'));
        expect(actual.split('|')[3]).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('25'));
        expect(actual.split('|')[0]).assertEqual('25');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1100
     * @tc.name: testEdgeReal0011
     * @tc.desc: Verify index 23 is the last row of a 24 row seed
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0011', 0, async (done: Function) => {
      await runCase('testEdgeReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0011 begin');
        const actual: string = runDataSourceIndex(24, 23);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7023|seed_23');
        logAssertion(DOMAIN, TAG, String(actual), String('7023|seed_23'));
        expect(actual).assertEqual('7023|seed_23');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('7023'));
        expect(actual.split('|')[0]).assertEqual('7023');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('seed_23')), 'true');
        expect(actual.endsWith('seed_23')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1200
     * @tc.name: testEdgeReal0012
     * @tc.desc: Verify index 24 of a 24 row seed is out of range
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0012', 0, async (done: Function) => {
      await runCase('testEdgeReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0012 begin');
        const actual: string = runDataSourceIndex(24, 24);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === runDataSourceIndex(24, 23)), 'false');
        expect(actual === runDataSourceIndex(24, 23)).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(1));
        expect(actual.split('|').length).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1300
     * @tc.name: testEdgeReal0013
     * @tc.desc: Verify a single row seed exposes only index 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0013', 0, async (done: Function) => {
      await runCase('testEdgeReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0013 begin');
        const actual: string = runDataSourceIndex(1, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7000|seed_0');
        logAssertion(DOMAIN, TAG, String(actual), String('7000|seed_0'));
        expect(actual).assertEqual('7000|seed_0');
        logAssertion(DOMAIN, TAG, String(actual), String(runDataSourceIndex(100, 0)));
        expect(actual).assertEqual(runDataSourceIndex(100, 0));
        logAssertion(DOMAIN, TAG, String(actual === runDataSourceIndex(1, 1)), 'false');
        expect(actual === runDataSourceIndex(1, 1)).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1400
     * @tc.name: testEdgeReal0014
     * @tc.desc: Verify the last row of a 100 row seed keeps the arithmetic id
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0014', 0, async (done: Function) => {
      await runCase('testEdgeReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0014 begin');
        const actual: string = runDataSourceIndex(100, 99);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7099|seed_99');
        logAssertion(DOMAIN, TAG, String(actual), String('7099|seed_99'));
        expect(actual).assertEqual('7099|seed_99');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('7099'));
        expect(actual.split('|')[0]).assertEqual('7099');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('seed_99')), 'true');
        expect(actual.endsWith('seed_99')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1500
     * @tc.name: testEdgeReal0015
     * @tc.desc: Verify head insertion plus three pushes keeps four notifications
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0015', 0, async (done: Function) => {
      await runCase('testEdgeReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0015 begin');
        const actual: string = runDataSourceMixed(5, 0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '9|9000|9102|4');
        logAssertion(DOMAIN, TAG, String(actual), String('9|9000|9102|4'));
        expect(actual).assertEqual('9|9000|9102|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('4'));
        expect(actual.split('|')[3]).assertEqual('4');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1600
     * @tc.name: testEdgeReal0016
     * @tc.desc: Verify tail insertion plus two pushes keeps the seeded head
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0016', 0, async (done: Function) => {
      await runCase('testEdgeReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0016 begin');
        const actual: string = runDataSourceMixed(5, 5, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '8|7000|9101|3');
        logAssertion(DOMAIN, TAG, String(actual), String('8|7000|9101|3'));
        expect(actual).assertEqual('8|7000|9101|3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('7000'));
        expect(actual.split('|')[1]).assertEqual('7000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('9101'));
        expect(actual.split('|')[2]).assertEqual('9101');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1700
     * @tc.name: testEdgeReal0017
     * @tc.desc: Verify an empty source accepts an insert and a push in one run
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0017', 0, async (done: Function) => {
      await runCase('testEdgeReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0017 begin');
        const actual: string = runDataSourceMixed(0, 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|9000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual), String('2|9000|9100|2'));
        expect(actual).assertEqual('2|9000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('9100'));
        expect(actual.split('|')[2]).assertEqual('9100');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1800
     * @tc.name: testEdgeReal0018
     * @tc.desc: Verify a middle insertion plus one push keeps the seeded head
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0018', 0, async (done: Function) => {
      await runCase('testEdgeReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0018 begin');
        const actual: string = runDataSourceMixed(4, 2, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '6|7000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual), String('6|7000|9100|2'));
        expect(actual).assertEqual('6|7000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('6'));
        expect(actual.split('|')[0]).assertEqual('6');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('2'));
        expect(actual.split('|')[3]).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_1900
     * @tc.name: testEdgeReal0019
     * @tc.desc: Verify two pushes after a tail insert keep the push order
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0019', 0, async (done: Function) => {
      await runCase('testEdgeReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0019 begin');
        const actual: string = runDataSourceMixed(2, 2, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7000|9101|3');
        logAssertion(DOMAIN, TAG, String(actual), String('5|7000|9101|3'));
        expect(actual).assertEqual('5|7000|9101|3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('9101'));
        expect(actual.split('|')[2]).assertEqual('9101');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('3'));
        expect(actual.split('|')[3]).assertEqual('3');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2000
     * @tc.name: testEdgeReal0020
     * @tc.desc: Verify the mixed snapshot agrees with the separate runs
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0020', 0, async (done: Function) => {
      await runCase('testEdgeReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0020 begin');
        const mixedTotal: number = Number(runDataSourceMixed(2, 2, 2).split('|')[0]);
        const addTotal: number = Number(runDataSourceAdd(2, 2).split('|')[0]);
        const pushTotal: number = Number(runDataSourcePush(2, 2).split('|')[0]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', mixedTotal,
          addTotal + pushTotal - 2);
        logAssertion(DOMAIN, TAG, String(mixedTotal), String(5));
        expect(mixedTotal).assertEqual(5);
        logAssertion(DOMAIN, TAG, String(addTotal), String(3));
        expect(addTotal).assertEqual(3);
        logAssertion(DOMAIN, TAG, String(pushTotal), String(4));
        expect(pushTotal).assertEqual(4);
        logAssertion(DOMAIN, TAG, String(mixedTotal), String(addTotal + pushTotal - 2));
        expect(mixedTotal).assertEqual(addTotal + pushTotal - 2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2100
     * @tc.name: testEdgeReal0021
     * @tc.desc: Verify the first listener is always registered even with count 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0021', 0, async (done: Function) => {
      await runCase('testEdgeReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0021 begin');
        const actual: string = runListenerNotify('add', 0, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|0|-1|-1'));
        expect(actual).assertEqual('1|0|0|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2200
     * @tc.name: testEdgeReal0022
     * @tc.desc: Verify a listener count above three saturates at three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0022', 0, async (done: Function) => {
      await runCase('testEdgeReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0022 begin');
        const actual: string = runListenerNotify('add', 1, 4);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerNotify('add', 1, 3)));
        expect(actual).assertEqual(runListenerNotify('add', 1, 3));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('1'));
        expect(actual.split('|')[3]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2300
     * @tc.name: testEdgeReal0023
     * @tc.desc: Verify a move notification forwards from and to as index and index + 1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0023', 0, async (done: Function) => {
      await runCase('testEdgeReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0023 begin');
        const actual: string = runListenerNotify('move', 3, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|3|4');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|3|4'));
        expect(actual).assertEqual('1|0|0|-1|3|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('3'));
        expect(actual.split('|')[4]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('4'));
        expect(actual.split('|')[5]).assertEqual('4');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2400
     * @tc.name: testEdgeReal0024
     * @tc.desc: Verify a move from index 0 forwards 0 and 1 to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0024', 0, async (done: Function) => {
      await runCase('testEdgeReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0024 begin');
        const actual: string = runListenerNotify('move', 0, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-1|0|1'));
        expect(actual).assertEqual('1|1|0|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('0'));
        expect(actual.split('|')[4]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('1'));
        expect(actual.split('|')[5]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2500
     * @tc.name: testEdgeReal0025
     * @tc.desc: Verify a move at index 100 reaches three listeners with raw indices
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0025', 0, async (done: Function) => {
      await runCase('testEdgeReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0025 begin');
        const actual: string = runListenerNotify('move', 100, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|100|101');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|-1|100|101'));
        expect(actual).assertEqual('1|1|1|-1|100|101');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('100'));
        expect(actual.split('|')[4]).assertEqual('100');
        logAssertion(DOMAIN, TAG, String(Number(actual.split('|')[5]) - Number(actual.split('|')[4])), String(1));
        expect(Number(actual.split('|')[5]) - Number(actual.split('|')[4])).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2600
     * @tc.name: testEdgeReal0026
     * @tc.desc: Verify a delete with the largest safe index is forwarded untouched
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0026', 0, async (done: Function) => {
      await runCase('testEdgeReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0026 begin');
        const actual: string = runListenerNotify('delete', Number.MAX_SAFE_INTEGER, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, MAX_INDEX);
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|' + MAX_INDEX + '|-1|-1'));
        expect(actual).assertEqual('1|1|0|' + MAX_INDEX + '|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String(MAX_INDEX));
        expect(actual.split('|')[3]).assertEqual(MAX_INDEX);
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('0'));
        expect(actual.split('|')[2]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2700
     * @tc.name: testEdgeReal0027
     * @tc.desc: Verify a delete with index -1 is forwarded and counted once
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0027', 0, async (done: Function) => {
      await runCase('testEdgeReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0027 begin');
        const actual: string = runListenerNotify('delete', -1, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|-1|-1'));
        expect(actual).assertEqual('1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-1'));
        expect(actual.split('|')[3]).assertEqual('-1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2800
     * @tc.name: testEdgeReal0028
     * @tc.desc: Verify an add with the largest safe index reaches three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0028', 0, async (done: Function) => {
      await runCase('testEdgeReal0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0028 begin');
        const actual: string = runListenerNotify('add', Number.MAX_SAFE_INTEGER, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, MAX_INDEX);
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|' + MAX_INDEX + '|-1|-1'));
        expect(actual).assertEqual('1|1|1|' + MAX_INDEX + '|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_2900
     * @tc.name: testEdgeReal0029
     * @tc.desc: Verify a reload ignores the index argument it was given
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEdgeReal0029', 0, async (done: Function) => {
      await runCase('testEdgeReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0029 begin');
        const actual: string = runListenerNotify('reload', 42, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|-1|-1'));
        expect(actual).assertEqual('1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerNotify('reload', 0, 1)));
        expect(actual).assertEqual(runListenerNotify('reload', 0, 1));
        logAssertion(DOMAIN, TAG, String(actual.indexOf('42')), String(-1));
        expect(actual.indexOf('42')).assertEqual(-1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3000
     * @tc.name: testEdgeReal0030
     * @tc.desc: Verify an unknown notification kind reaches no listener at all
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0030', 0, async (done: Function) => {
      await runCase('testEdgeReal0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0030 begin');
        const actual: string = runListenerNotify('noop', 0, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('0|0|0|-1|-1|-1'));
        expect(actual).assertEqual('0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('0'));
        expect(actual.split('|')[0]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual === runListenerNotify('add', 0, 2)), 'false');
        expect(actual === runListenerNotify('add', 0, 2)).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3100
     * @tc.name: testEdgeReal0031
     * @tc.desc: Verify a change at index 9 is forwarded to a single listener
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0031', 0, async (done: Function) => {
      await runCase('testEdgeReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0031 begin');
        const actual: string = runListenerNotify('change', 9, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|9|-1|-1'));
        expect(actual).assertEqual('1|0|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('9'));
        expect(actual.split('|')[3]).assertEqual('9');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('-1|-1')), 'true');
        expect(actual.endsWith('-1|-1')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3200
     * @tc.name: testEdgeReal0032
     * @tc.desc: Verify a change at index -9 is forwarded to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0032', 0, async (done: Function) => {
      await runCase('testEdgeReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0032 begin');
        const actual: string = runListenerNotify('change', -9, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-9|-1|-1'));
        expect(actual).assertEqual('1|1|0|-9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-9'));
        expect(actual.split('|')[3]).assertEqual('-9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(actual.split('|')[0]));
        expect(actual.split('|')[1]).assertEqual(actual.split('|')[0]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3300
     * @tc.name: testEdgeReal0033
     * @tc.desc: Verify the probe seed length mirrors the frozen song table size
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0033', 0, async (done: Function) => {
      await runCase('testEdgeReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0033 begin');
        const seeded: string = runDataSourcePush(SONG_COUNT, 0).split('|')[0];
        const table: string = runSongStats('count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', seeded, table);
        logAssertion(DOMAIN, TAG, String(seeded), String('24'));
        expect(seeded).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(seeded), String(table));
        expect(seeded).assertEqual(table);
        logAssertion(DOMAIN, TAG, String(seeded), String(SONG_COUNT.toString()));
        expect(seeded).assertEqual(SONG_COUNT.toString());
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3400
     * @tc.name: testEdgeReal0034
     * @tc.desc: Verify the seeded ids advance by one per row from head to tail
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0034', 0, async (done: Function) => {
      await runCase('testEdgeReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0034 begin');
        const head: number = Number(runDataSourceIndex(24, 0).split('|')[0]);
        const tail: number = Number(runDataSourceIndex(24, 23).split('|')[0]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', tail - head, 23);
        logAssertion(DOMAIN, TAG, String(head), String(7000));
        expect(head).assertEqual(7000);
        logAssertion(DOMAIN, TAG, String(tail), String(7023));
        expect(tail).assertEqual(7023);
        logAssertion(DOMAIN, TAG, String(tail - head), String(23));
        expect(tail - head).assertEqual(23);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_EDGE_01_3500
     * @tc.name: testEdgeReal0035
     * @tc.desc: Verify appending to a 24 row seed reports the 25th row index
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEdgeReal0035', 0, async (done: Function) => {
      await runCase('testEdgeReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0035 begin');
        const snapshot: string = runDataSourceAdd(SONG_COUNT, SONG_COUNT);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', snapshot, '25|24|24');
        logAssertion(DOMAIN, TAG, String(snapshot), String('25|24|24'));
        expect(snapshot).assertEqual('25|24|24');
        logAssertion(DOMAIN, TAG, String(snapshot.split('|')[0]), String(String(SONG_COUNT + 1)));
        expect(snapshot.split('|')[0]).assertEqual(String(SONG_COUNT + 1));
        logAssertion(DOMAIN, TAG, String(snapshot.split('|')[1]), String(snapshot.split('|')[2]));
        expect(snapshot.split('|')[1]).assertEqual(snapshot.split('|')[2]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0035 end');
      }, done);
    });

  })
}
