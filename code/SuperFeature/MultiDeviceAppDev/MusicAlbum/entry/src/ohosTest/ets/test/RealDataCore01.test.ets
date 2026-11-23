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
 * Hand written showcase suite for MyDataSource (SongModule.ets).
 * Covers the legal / boundary / extreme / combination dimensions that the
 * generated volume buckets only sample; every expectation is derived from the
 * frozen rules of the SUT:
 *   - constructor copies the seed array, so totalCount === seed length;
 *   - getData(i) returns the i-th row for 0 <= i < n and undefined otherwise;
 *   - addData(k, d) is Array#splice(k, 0, d) and notifyDataAdd echoes k as-is;
 *   - pushData(d) appends and notifies with the new last index.
 */
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  runDataSource,
  runDataSourceAdd,
  runDataSourceBoundary,
  runDataSourceIndex,
  runDataSourceMixed,
  runDataSourcePush
} from '../util/DataSourceProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realDataCore01Test(): void {
  describe('RealDataCore01Test', () => {

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0100
     * @tc.name: testDsReal0001
     * @tc.desc: Verify an empty seed keeps totalCount 0 and getData(0) undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0001', 0, async (done: Function) => {
      await runCase('testDsReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0001 begin');
        const actual: string = runDataSource(0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|empty|empty|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('0|empty|empty|undefined'));
        expect(actual).assertEqual('0|empty|empty|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(4));
        expect(actual.split('|').length).assertEqual(4);
        logAssertion(DOMAIN, TAG, String(actual.startsWith('0|')), 'true');
        expect(actual.startsWith('0|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0200
     * @tc.name: testDsReal0002
     * @tc.desc: Verify a single row seed reports the same id for head and tail
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0002', 0, async (done: Function) => {
      await runCase('testDsReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0002 begin');
        const actual: string = runDataSource(1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|7000|7000|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('1|7000|7000|undefined'));
        expect(actual).assertEqual('1|7000|7000|undefined');
        const parts: string[] = actual.split('|');
        logAssertion(DOMAIN, TAG, String(parts[1]), String(parts[2]));
        expect(parts[1]).assertEqual(parts[2]);
        logAssertion(DOMAIN, TAG, String(parts[3]), String('undefined'));
        expect(parts[3]).assertEqual('undefined');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0300
     * @tc.name: testDsReal0003
     * @tc.desc: Verify two rows expose 7000 and 7001 as head and tail
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0003', 0, async (done: Function) => {
      await runCase('testDsReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0003 begin');
        const actual: string = runDataSource(2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|7000|7001|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('2|7000|7001|undefined'));
        expect(actual).assertEqual('2|7000|7001|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('7001'));
        expect(actual.split('|')[2]).assertEqual('7001');
        logAssertion(DOMAIN, TAG, String(actual === '2|7000|7000|undefined'), 'false');
        expect(actual === '2|7000|7000|undefined').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0400
     * @tc.name: testDsReal0004
     * @tc.desc: Verify three rows keep insertion order 7000..7002
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0004', 0, async (done: Function) => {
      await runCase('testDsReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0004 begin');
        const actual: string = runDataSource(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|7000|7002|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('3|7000|7002|undefined'));
        expect(actual).assertEqual('3|7000|7002|undefined');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('3|')), 'true');
        expect(actual.startsWith('3|')).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual.endsWith('|undefined')), 'true');
        expect(actual.endsWith('|undefined')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0500
     * @tc.name: testDsReal0005
     * @tc.desc: Verify five rows report tail 7004
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0005', 0, async (done: Function) => {
      await runCase('testDsReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0005 begin');
        const actual: string = runDataSource(5);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7000|7004|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('5|7000|7004|undefined'));
        expect(actual).assertEqual('5|7000|7004|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('7004'));
        expect(actual.split('|')[2]).assertEqual('7004');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('7000'));
        expect(actual.split('|')[1]).assertEqual('7000');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0600
     * @tc.name: testDsReal0006
     * @tc.desc: Verify ten rows report tail 7009
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0006', 0, async (done: Function) => {
      await runCase('testDsReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0006 begin');
        const actual: string = runDataSource(10);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '10|7000|7009|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('10|7000|7009|undefined'));
        expect(actual).assertEqual('10|7000|7009|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('10'));
        expect(actual.split('|')[0]).assertEqual('10');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('7009'));
        expect(actual.split('|')[2]).assertEqual('7009');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0700
     * @tc.name: testDsReal0007
     * @tc.desc: Verify a 24 row seed matches the length of the frozen song table
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0007', 0, async (done: Function) => {
      await runCase('testDsReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0007 begin');
        const actual: string = runDataSource(24);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '24|7000|7023|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('24|7000|7023|undefined'));
        expect(actual).assertEqual('24|7000|7023|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('24'));
        expect(actual.split('|')[0]).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('7023'));
        expect(actual.split('|')[2]).assertEqual('7023');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0800
     * @tc.name: testDsReal0008
     * @tc.desc: Verify a 100 row seed keeps the arithmetic id progression
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0008', 0, async (done: Function) => {
      await runCase('testDsReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0008 begin');
        const actual: string = runDataSource(100);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '100|7000|7099|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('100|7000|7099|undefined'));
        expect(actual).assertEqual('100|7000|7099|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('100'));
        expect(actual.split('|')[0]).assertEqual('100');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('7000'));
        expect(actual.split('|')[1]).assertEqual('7000');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_0900
     * @tc.name: testDsReal0009
     * @tc.desc: Verify a negative index yields undefined instead of a wrap-around row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0009', 0, async (done: Function) => {
      await runCase('testDsReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0009 begin');
        const actual: string = runDataSourceIndex(3, -1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === '7002|seed_2'), 'false');
        expect(actual === '7002|seed_2').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.length), String(9));
        expect(actual.length).assertEqual(9);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1000
     * @tc.name: testDsReal0010
     * @tc.desc: Verify index 0 resolves to the first seeded row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0010', 0, async (done: Function) => {
      await runCase('testDsReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0010 begin');
        const actual: string = runDataSourceIndex(3, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7000|seed_0');
        logAssertion(DOMAIN, TAG, String(actual), String('7000|seed_0'));
        expect(actual).assertEqual('7000|seed_0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('7000'));
        expect(actual.split('|')[0]).assertEqual('7000');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('seed_0')), 'true');
        expect(actual.endsWith('seed_0')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1100
     * @tc.name: testDsReal0011
     * @tc.desc: Verify the last valid index resolves to the tail row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0011', 0, async (done: Function) => {
      await runCase('testDsReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0011 begin');
        const actual: string = runDataSourceIndex(3, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7002|seed_2');
        logAssertion(DOMAIN, TAG, String(actual), String('7002|seed_2'));
        expect(actual).assertEqual('7002|seed_2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('7002'));
        expect(actual.split('|')[0]).assertEqual('7002');
        logAssertion(DOMAIN, TAG, String(actual === '7000|seed_0'), 'false');
        expect(actual === '7000|seed_0').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1200
     * @tc.name: testDsReal0012
     * @tc.desc: Verify index === totalCount is out of range
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0012', 0, async (done: Function) => {
      await runCase('testDsReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0012 begin');
        const actual: string = runDataSourceIndex(3, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(1));
        expect(actual.split('|').length).assertEqual(1);
        logAssertion(DOMAIN, TAG, String(actual === '7002|seed_2'), 'false');
        expect(actual === '7002|seed_2').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1300
     * @tc.name: testDsReal0013
     * @tc.desc: Verify a far out of range index stays undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0013', 0, async (done: Function) => {
      await runCase('testDsReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0013 begin');
        const actual: string = runDataSourceIndex(3, 100);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual), String(runDataSourceIndex(3, 3)));
        expect(actual).assertEqual(runDataSourceIndex(3, 3));
        logAssertion(DOMAIN, TAG, String(actual.includes('|')), 'false');
        expect(actual.includes('|')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1400
     * @tc.name: testDsReal0014
     * @tc.desc: Verify an empty data source has no valid index at all
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0014', 0, async (done: Function) => {
      await runCase('testDsReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0014 begin');
        const actual: string = runDataSourceIndex(0, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === '7000|seed_0'), 'false');
        expect(actual === '7000|seed_0').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.startsWith('undefined')), 'true');
        expect(actual.startsWith('undefined')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1500
     * @tc.name: testDsReal0015
     * @tc.desc: Verify inserting at 0 moves the previous head to position 1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0015', 0, async (done: Function) => {
      await runCase('testDsReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0015 begin');
        const actual: string = runDataSourceAdd(2, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('3|0|0'));
        expect(actual).assertEqual('3|0|0');
        logAssertion(DOMAIN, TAG, String(runDataSourceIndex(2, 0) === '9000|probe_9000'), 'false');
        expect(runDataSourceIndex(2, 0) === '9000|probe_9000').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1600
     * @tc.name: testDsReal0016
     * @tc.desc: Verify inserting at the middle keeps the new row at index 1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0016', 0, async (done: Function) => {
      await runCase('testDsReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0016 begin');
        const actual: string = runDataSourceAdd(2, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|1|1');
        logAssertion(DOMAIN, TAG, String(actual), String('3|1|1'));
        expect(actual).assertEqual('3|1|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('3'));
        expect(actual.split('|')[0]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1700
     * @tc.name: testDsReal0017
     * @tc.desc: Verify inserting at totalCount appends the row at the tail
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0017', 0, async (done: Function) => {
      await runCase('testDsReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0017 begin');
        const actual: string = runDataSourceAdd(2, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|2|2');
        logAssertion(DOMAIN, TAG, String(actual), String('3|2|2'));
        expect(actual).assertEqual('3|2|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('2'));
        expect(actual.split('|')[1]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('2'));
        expect(actual.split('|')[2]).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1800
     * @tc.name: testDsReal0018
     * @tc.desc: Verify an index beyond totalCount still appends while the notify keeps the raw index
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0018', 0, async (done: Function) => {
      await runCase('testDsReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0018 begin');
        const actual: string = runDataSourceAdd(2, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|2|3');
        logAssertion(DOMAIN, TAG, String(actual), String('3|2|3'));
        expect(actual).assertEqual('3|2|3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('2'));
        expect(actual.split('|')[1]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('3'));
        expect(actual.split('|')[2]).assertEqual('3');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_1900
     * @tc.name: testDsReal0019
     * @tc.desc: Verify insertAt -1 lands before the last row and notifies -1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0019', 0, async (done: Function) => {
      await runCase('testDsReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0019 begin');
        const actual: string = runDataSourceAdd(2, -1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('3|1|-1'));
        expect(actual).assertEqual('3|1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('-1'));
        expect(actual.split('|')[2]).assertEqual('-1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2000
     * @tc.name: testDsReal0020
     * @tc.desc: Verify inserting into an empty source produces a single row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0020', 0, async (done: Function) => {
      await runCase('testDsReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0020 begin');
        const actual: string = runDataSourceAdd(0, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0'));
        expect(actual).assertEqual('1|0|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2100
     * @tc.name: testDsReal0021
     * @tc.desc: Verify the first push into an empty source notifies index 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0021', 0, async (done: Function) => {
      await runCase('testDsReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0021 begin');
        const actual: string = runDataSourcePush(0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9100|1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|9100|1|0'));
        expect(actual).assertEqual('1|9100|1|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('0'));
        expect(actual.split('|')[3]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2200
     * @tc.name: testDsReal0022
     * @tc.desc: Verify pushing onto two rows notifies the new last index 2
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0022', 0, async (done: Function) => {
      await runCase('testDsReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0022 begin');
        const actual: string = runDataSourcePush(2, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9100|1|2');
        logAssertion(DOMAIN, TAG, String(actual), String('3|9100|1|2'));
        expect(actual).assertEqual('3|9100|1|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9100'));
        expect(actual.split('|')[1]).assertEqual('9100');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('2'));
        expect(actual.split('|')[3]).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2300
     * @tc.name: testDsReal0023
     * @tc.desc: Verify three pushes keep the order 9100..9102 and notify three times
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0023', 0, async (done: Function) => {
      await runCase('testDsReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0023 begin');
        const actual: string = runDataSourcePush(2, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|9102|3|4');
        logAssertion(DOMAIN, TAG, String(actual), String('5|9102|3|4'));
        expect(actual).assertEqual('5|9102|3|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('3'));
        expect(actual.split('|')[2]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9102'));
        expect(actual.split('|')[1]).assertEqual('9102');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2400
     * @tc.name: testDsReal0024
     * @tc.desc: Verify a five row source accepts two pushes and ends at index 6
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0024', 0, async (done: Function) => {
      await runCase('testDsReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0024 begin');
        const actual: string = runDataSourcePush(5, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7|9101|2|6');
        logAssertion(DOMAIN, TAG, String(actual), String('7|9101|2|6'));
        expect(actual).assertEqual('7|9101|2|6');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('7'));
        expect(actual.split('|')[0]).assertEqual('7');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('6'));
        expect(actual.split('|')[3]).assertEqual('6');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2500
     * @tc.name: testDsReal0025
     * @tc.desc: Verify zero pushes leave the source untouched and silent
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0025', 0, async (done: Function) => {
      await runCase('testDsReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0025 begin');
        const actual: string = runDataSourcePush(5, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7004|0|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('5|7004|0|-1'));
        expect(actual).assertEqual('5|7004|0|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('0'));
        expect(actual.split('|')[2]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-1'));
        expect(actual.split('|')[3]).assertEqual('-1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2600
     * @tc.name: testDsReal0026
     * @tc.desc: Verify add then push on one instance keeps both notifications and the new head
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0026', 0, async (done: Function) => {
      await runCase('testDsReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0026 begin');
        const actual: string = runDataSourceMixed(2, 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|9000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual), String('4|9000|9100|2'));
        expect(actual).assertEqual('4|9000|9100|2');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('2'));
        expect(actual.split('|')[3]).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2700
     * @tc.name: testDsReal0027
     * @tc.desc: Verify add beyond length without a push keeps the tail as the inserted row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0027', 0, async (done: Function) => {
      await runCase('testDsReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0027 begin');
        const actual: string = runDataSourceMixed(3, 3, 0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|7000|9000|1');
        logAssertion(DOMAIN, TAG, String(actual), String('4|7000|9000|1'));
        expect(actual).assertEqual('4|7000|9000|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('9000'));
        expect(actual.split('|')[2]).assertEqual('9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('1'));
        expect(actual.split('|')[3]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2800
     * @tc.name: testDsReal0028
     * @tc.desc: Verify MAX_SAFE_INTEGER as index never returns a row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0028', 0, async (done: Function) => {
      await runCase('testDsReal0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0028 begin');
        const actual: string = runDataSourceBoundary('max-safe');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === 'leak'), 'false');
        expect(actual === 'leak').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.length), String(9));
        expect(actual.length).assertEqual(9);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_2900
     * @tc.name: testDsReal0029
     * @tc.desc: Verify a negative index on a non empty source stays undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0029', 0, async (done: Function) => {
      await runCase('testDsReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0029 begin');
        const actual: string = runDataSourceBoundary('neg-index');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === 'leak'), 'false');
        expect(actual === 'leak').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.startsWith('undef')), 'true');
        expect(actual.startsWith('undef')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3000
     * @tc.name: testDsReal0030
     * @tc.desc: Verify push into an empty source yields exactly one row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0030', 0, async (done: Function) => {
      await runCase('testDsReal0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0030 begin');
        const actual: string = runDataSourceBoundary('empty-push');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
        logAssertion(DOMAIN, TAG, String(actual), String('1|9000'));
        expect(actual).assertEqual('1|9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(2));
        expect(actual.split('|').length).assertEqual(2);
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3100
     * @tc.name: testDsReal0031
     * @tc.desc: Verify add at 0 into an empty source behaves like push
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0031', 0, async (done: Function) => {
      await runCase('testDsReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0031 begin');
        const actual: string = runDataSourceBoundary('empty-add-zero');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
        logAssertion(DOMAIN, TAG, String(actual), String('1|9000'));
        expect(actual).assertEqual('1|9000');
        logAssertion(DOMAIN, TAG, String(actual), String(runDataSourceBoundary('empty-push')));
        expect(actual).assertEqual(runDataSourceBoundary('empty-push'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3200
     * @tc.name: testDsReal0032
     * @tc.desc: Verify add at 5 into an empty source is clamped to the only slot
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0032', 0, async (done: Function) => {
      await runCase('testDsReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0032 begin');
        const actual: string = runDataSourceBoundary('empty-add-over');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
        logAssertion(DOMAIN, TAG, String(actual), String('1|9000'));
        expect(actual).assertEqual('1|9000');
        logAssertion(DOMAIN, TAG, String(actual === '0|empty'), 'false');
        expect(actual === '0|empty').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3300
     * @tc.name: testDsReal0033
     * @tc.desc: Verify add at -1 into an empty source is clamped to the only slot
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0033', 0, async (done: Function) => {
      await runCase('testDsReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0033 begin');
        const actual: string = runDataSourceBoundary('empty-add-neg');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
        logAssertion(DOMAIN, TAG, String(actual), String('1|9000'));
        expect(actual).assertEqual('1|9000');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('9000'));
        expect(actual.split('|')[1]).assertEqual('9000');
        logAssertion(DOMAIN, TAG, String(actual.includes('undefined')), 'false');
        expect(actual.includes('undefined')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3400
     * @tc.name: testDsReal0034
     * @tc.desc: Verify the constructor copies the seed, so later seed mutations are invisible
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDsReal0034', 0, async (done: Function) => {
      await runCase('testDsReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0034 begin');
        const actual: string = runDataSourceBoundary('seed-isolation');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|4');
        logAssertion(DOMAIN, TAG, String(actual), String('3|4'));
        expect(actual).assertEqual('3|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('3'));
        expect(actual.split('|')[0]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('4'));
        expect(actual.split('|')[1]).assertEqual('4');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_DATA_CORE_01_3500
     * @tc.name: testDsReal0035
     * @tc.desc: Verify an explicitly empty array seed is handled like a zero length source
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDsReal0035', 0, async (done: Function) => {
      await runCase('testDsReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0035 begin');
        const actual: string = runDataSourceBoundary('seed-empty');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('0|undefined'));
        expect(actual).assertEqual('0|undefined');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('0'));
        expect(actual.split('|')[0]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('undefined')), 'true');
        expect(actual.endsWith('undefined')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0035 end');
      }, done);
    });
  })
}
