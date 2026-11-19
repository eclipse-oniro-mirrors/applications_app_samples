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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

export default function realDataCore01Test() {
  describe('RealDataCore01', () => {

    /**
     * @tc.name   testDsReal0001
     * @tc.number SUB_MUSICALBUM_DS_REAL_0001
     * @tc.desc   Anchor: an empty seed keeps totalCount 0 and getData(0) undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0001 begin');
      const actual: string = runDataSource(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|empty|empty|undefined');
      expect(actual).assertEqual('0|empty|empty|undefined');
      expect(actual.split('|').length).assertEqual(4);
      expect(actual.startsWith('0|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0001 end');
    })

    /**
     * @tc.name   testDsReal0002
     * @tc.number SUB_MUSICALBUM_DS_REAL_0002
     * @tc.desc   a single row seed reports the same id for head and tail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0002 begin');
      const actual: string = runDataSource(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|7000|7000|undefined');
      expect(actual).assertEqual('1|7000|7000|undefined');
      const parts: string[] = actual.split('|');
      expect(parts[1]).assertEqual(parts[2]);
      expect(parts[3]).assertEqual('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0002 end');
    })

    /**
     * @tc.name   testDsReal0003
     * @tc.number SUB_MUSICALBUM_DS_REAL_0003
     * @tc.desc   two rows expose 7000 and 7001 as head and tail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0003 begin');
      const actual: string = runDataSource(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|7000|7001|undefined');
      expect(actual).assertEqual('2|7000|7001|undefined');
      expect(actual.split('|')[2]).assertEqual('7001');
      expect(actual === '2|7000|7000|undefined').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0003 end');
    })

    /**
     * @tc.name   testDsReal0004
     * @tc.number SUB_MUSICALBUM_DS_REAL_0004
     * @tc.desc   three rows keep insertion order 7000..7002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0004 begin');
      const actual: string = runDataSource(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|7000|7002|undefined');
      expect(actual).assertEqual('3|7000|7002|undefined');
      expect(actual.startsWith('3|')).assertTrue();
      expect(actual.endsWith('|undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0004 end');
    })

    /**
     * @tc.name   testDsReal0005
     * @tc.number SUB_MUSICALBUM_DS_REAL_0005
     * @tc.desc   five rows report tail 7004
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0005 begin');
      const actual: string = runDataSource(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7000|7004|undefined');
      expect(actual).assertEqual('5|7000|7004|undefined');
      expect(actual.split('|')[2]).assertEqual('7004');
      expect(actual.split('|')[1]).assertEqual('7000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0005 end');
    })

    /**
     * @tc.name   testDsReal0006
     * @tc.number SUB_MUSICALBUM_DS_REAL_0006
     * @tc.desc   ten rows report tail 7009
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0006 begin');
      const actual: string = runDataSource(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '10|7000|7009|undefined');
      expect(actual).assertEqual('10|7000|7009|undefined');
      expect(actual.split('|')[0]).assertEqual('10');
      expect(actual.split('|')[2]).assertEqual('7009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0006 end');
    })

    /**
     * @tc.name   testDsReal0007
     * @tc.number SUB_MUSICALBUM_DS_REAL_0007
     * @tc.desc   a 24 row seed matches the length of the frozen song table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0007 begin');
      const actual: string = runDataSource(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '24|7000|7023|undefined');
      expect(actual).assertEqual('24|7000|7023|undefined');
      expect(actual.split('|')[0]).assertEqual('24');
      expect(actual.split('|')[2]).assertEqual('7023');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0007 end');
    })

    /**
     * @tc.name   testDsReal0008
     * @tc.number SUB_MUSICALBUM_DS_REAL_0008
     * @tc.desc   a 100 row seed keeps the arithmetic id progression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0008 begin');
      const actual: string = runDataSource(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '100|7000|7099|undefined');
      expect(actual).assertEqual('100|7000|7099|undefined');
      expect(actual.split('|')[0]).assertEqual('100');
      expect(actual.split('|')[1]).assertEqual('7000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0008 end');
    })

    /**
     * @tc.name   testDsReal0009
     * @tc.number SUB_MUSICALBUM_DS_REAL_0009
     * @tc.desc   Anchor: a negative index yields undefined instead of a wrap-around row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0009 begin');
      const actual: string = runDataSourceIndex(3, -1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === '7002|seed_2').assertFalse();
      expect(actual.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0009 end');
    })

    /**
     * @tc.name   testDsReal0010
     * @tc.number SUB_MUSICALBUM_DS_REAL_0010
     * @tc.desc   index 0 resolves to the first seeded row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0010 begin');
      const actual: string = runDataSourceIndex(3, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7000|seed_0');
      expect(actual).assertEqual('7000|seed_0');
      expect(actual.split('|')[0]).assertEqual('7000');
      expect(actual.endsWith('seed_0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0010 end');
    })

    /**
     * @tc.name   testDsReal0011
     * @tc.number SUB_MUSICALBUM_DS_REAL_0011
     * @tc.desc   the last valid index resolves to the tail row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0011 begin');
      const actual: string = runDataSourceIndex(3, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7002|seed_2');
      expect(actual).assertEqual('7002|seed_2');
      expect(actual.split('|')[0]).assertEqual('7002');
      expect(actual === '7000|seed_0').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0011 end');
    })

    /**
     * @tc.name   testDsReal0012
     * @tc.number SUB_MUSICALBUM_DS_REAL_0012
     * @tc.desc   index === totalCount is out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0012 begin');
      const actual: string = runDataSourceIndex(3, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual.split('|').length).assertEqual(1);
      expect(actual === '7002|seed_2').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0012 end');
    })

    /**
     * @tc.name   testDsReal0013
     * @tc.number SUB_MUSICALBUM_DS_REAL_0013
     * @tc.desc   a far out of range index stays undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0013 begin');
      const actual: string = runDataSourceIndex(3, 100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual).assertEqual(runDataSourceIndex(3, 3));
      expect(actual.includes('|')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0013 end');
    })

    /**
     * @tc.name   testDsReal0014
     * @tc.number SUB_MUSICALBUM_DS_REAL_0014
     * @tc.desc   Anchor: an empty data source has no valid index at all
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0014 begin');
      const actual: string = runDataSourceIndex(0, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === '7000|seed_0').assertFalse();
      expect(actual.startsWith('undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0014 end');
    })

    /**
     * @tc.name   testDsReal0015
     * @tc.number SUB_MUSICALBUM_DS_REAL_0015
     * @tc.desc   inserting at 0 moves the previous head to position 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0015 begin');
      const actual: string = runDataSourceAdd(2, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|0|0');
      expect(actual).assertEqual('3|0|0');
      expect(runDataSourceIndex(2, 0) === '9000|probe_9000').assertFalse();
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0015 end');
    })

    /**
     * @tc.name   testDsReal0016
     * @tc.number SUB_MUSICALBUM_DS_REAL_0016
     * @tc.desc   inserting at the middle keeps the new row at index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0016 begin');
      const actual: string = runDataSourceAdd(2, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|1|1');
      expect(actual).assertEqual('3|1|1');
      expect(actual.split('|')[0]).assertEqual('3');
      expect(actual.split('|')[2]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0016 end');
    })

    /**
     * @tc.name   testDsReal0017
     * @tc.number SUB_MUSICALBUM_DS_REAL_0017
     * @tc.desc   inserting at totalCount appends the row at the tail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0017 begin');
      const actual: string = runDataSourceAdd(2, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|2|2');
      expect(actual).assertEqual('3|2|2');
      expect(actual.split('|')[1]).assertEqual('2');
      expect(actual.split('|')[2]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0017 end');
    })

    /**
     * @tc.name   testDsReal0018
     * @tc.number SUB_MUSICALBUM_DS_REAL_0018
     * @tc.desc   an index beyond totalCount still appends while the notify keeps the raw index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0018 begin');
      const actual: string = runDataSourceAdd(2, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|2|3');
      expect(actual).assertEqual('3|2|3');
      expect(actual.split('|')[1]).assertEqual('2');
      expect(actual.split('|')[2]).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0018 end');
    })

    /**
     * @tc.name   testDsReal0019
     * @tc.number SUB_MUSICALBUM_DS_REAL_0019
     * @tc.desc   Anchor: insertAt -1 lands before the last row and notifies -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0019 begin');
      const actual: string = runDataSourceAdd(2, -1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|1|-1');
      expect(actual).assertEqual('3|1|-1');
      expect(actual.split('|')[1]).assertEqual('1');
      expect(actual.split('|')[2]).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0019 end');
    })

    /**
     * @tc.name   testDsReal0020
     * @tc.number SUB_MUSICALBUM_DS_REAL_0020
     * @tc.desc   inserting into an empty source produces a single row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0020 begin');
      const actual: string = runDataSourceAdd(0, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0');
      expect(actual).assertEqual('1|0|0');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0020 end');
    })

    /**
     * @tc.name   testDsReal0021
     * @tc.number SUB_MUSICALBUM_DS_REAL_0021
     * @tc.desc   the first push into an empty source notifies index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0021 begin');
      const actual: string = runDataSourcePush(0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9100|1|0');
      expect(actual).assertEqual('1|9100|1|0');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0021 end');
    })

    /**
     * @tc.name   testDsReal0022
     * @tc.number SUB_MUSICALBUM_DS_REAL_0022
     * @tc.desc   pushing onto two rows notifies the new last index 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0022 begin');
      const actual: string = runDataSourcePush(2, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9100|1|2');
      expect(actual).assertEqual('3|9100|1|2');
      expect(actual.split('|')[1]).assertEqual('9100');
      expect(actual.split('|')[3]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0022 end');
    })

    /**
     * @tc.name   testDsReal0023
     * @tc.number SUB_MUSICALBUM_DS_REAL_0023
     * @tc.desc   three pushes keep the order 9100..9102 and notify three times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0023 begin');
      const actual: string = runDataSourcePush(2, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|9102|3|4');
      expect(actual).assertEqual('5|9102|3|4');
      expect(actual.split('|')[2]).assertEqual('3');
      expect(actual.split('|')[1]).assertEqual('9102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0023 end');
    })

    /**
     * @tc.name   testDsReal0024
     * @tc.number SUB_MUSICALBUM_DS_REAL_0024
     * @tc.desc   a five row source accepts two pushes and ends at index 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0024 begin');
      const actual: string = runDataSourcePush(5, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7|9101|2|6');
      expect(actual).assertEqual('7|9101|2|6');
      expect(actual.split('|')[0]).assertEqual('7');
      expect(actual.split('|')[3]).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0024 end');
    })

    /**
     * @tc.name   testDsReal0025
     * @tc.number SUB_MUSICALBUM_DS_REAL_0025
     * @tc.desc   zero pushes leave the source untouched and silent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0025 begin');
      const actual: string = runDataSourcePush(5, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7004|0|-1');
      expect(actual).assertEqual('5|7004|0|-1');
      expect(actual.split('|')[2]).assertEqual('0');
      expect(actual.split('|')[3]).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0025 end');
    })

    /**
     * @tc.name   testDsReal0026
     * @tc.number SUB_MUSICALBUM_DS_REAL_0026
     * @tc.desc   add then push on one instance keeps both notifications and the new head
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0026 begin');
      const actual: string = runDataSourceMixed(2, 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|9000|9100|2');
      expect(actual).assertEqual('4|9000|9100|2');
      expect(actual.split('|')[1]).assertEqual('9000');
      expect(actual.split('|')[3]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0026 end');
    })

    /**
     * @tc.name   testDsReal0027
     * @tc.number SUB_MUSICALBUM_DS_REAL_0027
     * @tc.desc   add beyond length without a push keeps the tail as the inserted row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0027 begin');
      const actual: string = runDataSourceMixed(3, 3, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|7000|9000|1');
      expect(actual).assertEqual('4|7000|9000|1');
      expect(actual.split('|')[2]).assertEqual('9000');
      expect(actual.split('|')[3]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0027 end');
    })

    /**
     * @tc.name   testDsReal0028
     * @tc.number SUB_MUSICALBUM_DS_REAL_0028
     * @tc.desc   Anchor: MAX_SAFE_INTEGER as index never returns a row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0028 begin');
      const actual: string = runDataSourceBoundary('max-safe');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === 'leak').assertFalse();
      expect(actual.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0028 end');
    })

    /**
     * @tc.name   testDsReal0029
     * @tc.number SUB_MUSICALBUM_DS_REAL_0029
     * @tc.desc   a negative index on a non empty source stays undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0029 begin');
      const actual: string = runDataSourceBoundary('neg-index');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === 'leak').assertFalse();
      expect(actual.startsWith('undef')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0029 end');
    })

    /**
     * @tc.name   testDsReal0030
     * @tc.number SUB_MUSICALBUM_DS_REAL_0030
     * @tc.desc   push into an empty source yields exactly one row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0030 begin');
      const actual: string = runDataSourceBoundary('empty-push');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
      expect(actual).assertEqual('1|9000');
      expect(actual.split('|').length).assertEqual(2);
      expect(actual.split('|')[1]).assertEqual('9000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0030 end');
    })

    /**
     * @tc.name   testDsReal0031
     * @tc.number SUB_MUSICALBUM_DS_REAL_0031
     * @tc.desc   add at 0 into an empty source behaves like push
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0031 begin');
      const actual: string = runDataSourceBoundary('empty-add-zero');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
      expect(actual).assertEqual('1|9000');
      expect(actual).assertEqual(runDataSourceBoundary('empty-push'));
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0031 end');
    })

    /**
     * @tc.name   testDsReal0032
     * @tc.number SUB_MUSICALBUM_DS_REAL_0032
     * @tc.desc   add at 5 into an empty source is clamped to the only slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0032 begin');
      const actual: string = runDataSourceBoundary('empty-add-over');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
      expect(actual).assertEqual('1|9000');
      expect(actual === '0|empty').assertFalse();
      expect(actual.split('|')[1]).assertEqual('9000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0032 end');
    })

    /**
     * @tc.name   testDsReal0033
     * @tc.number SUB_MUSICALBUM_DS_REAL_0033
     * @tc.desc   add at -1 into an empty source is clamped to the only slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0033 begin');
      const actual: string = runDataSourceBoundary('empty-add-neg');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|9000');
      expect(actual).assertEqual('1|9000');
      expect(actual.split('|')[1]).assertEqual('9000');
      expect(actual.includes('undefined')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0033 end');
    })

    /**
     * @tc.name   testDsReal0034
     * @tc.number SUB_MUSICALBUM_DS_REAL_0034
     * @tc.desc   the constructor copies the seed, so later seed mutations are invisible
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testDsReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0034 begin');
      const actual: string = runDataSourceBoundary('seed-isolation');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|4');
      expect(actual).assertEqual('3|4');
      expect(actual.split('|')[0]).assertEqual('3');
      expect(actual.split('|')[1]).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0034 end');
    })

    /**
     * @tc.name   testDsReal0035
     * @tc.number SUB_MUSICALBUM_DS_REAL_0035
     * @tc.desc   an explicitly empty array seed is handled like a zero length source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDsReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0035 begin');
      const actual: string = runDataSourceBoundary('seed-empty');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|undefined');
      expect(actual).assertEqual('0|undefined');
      expect(actual.split('|')[0]).assertEqual('0');
      expect(actual.endsWith('undefined')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDsReal0035 end');
    })
  })
}
