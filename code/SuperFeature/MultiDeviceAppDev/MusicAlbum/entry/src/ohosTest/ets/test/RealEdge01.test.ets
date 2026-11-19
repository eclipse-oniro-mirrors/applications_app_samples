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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

export default function realEdge01Test() {
  describe('RealEdge01', () => {

    /**
     * @tc.name   testEdgeReal0001
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0001
     * @tc.desc   Anchor: addData(100) lands on the tail yet echoes the raw index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0001 begin');
      const actual: string = runDataSourceAdd(3, 100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4|3|100');
      expect(actual).assertEqual('4|3|100');
      expect(actual.split('|')[1]).assertEqual('3');
      expect(actual.split('|')[2]).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0001 end');
    })

    /**
     * @tc.name   testEdgeReal0002
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0002
     * @tc.desc   addData(0) shifts a four row seed and lands on the head
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0002 begin');
      const actual: string = runDataSourceAdd(4, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|0|0');
      expect(actual).assertEqual('5|0|0');
      expect(actual.split('|')[0]).assertEqual('5');
      expect(actual.split('|')[1]).assertEqual(actual.split('|')[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0002 end');
    })

    /**
     * @tc.name   testEdgeReal0003
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0003
     * @tc.desc   Anchor: addData at exactly totalCount appends without clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0003 begin');
      const actual: string = runDataSourceAdd(4, 4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|4|4');
      expect(actual).assertEqual('5|4|4');
      expect(actual.split('|')[1]).assertEqual('4');
      expect(actual.split('|')[1]).assertEqual(actual.split('|')[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0003 end');
    })

    /**
     * @tc.name   testEdgeReal0004
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0004
     * @tc.desc   addData(-2) inserts before the last two rows and echoes -2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0004 begin');
      const actual: string = runDataSourceAdd(5, -2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '6|3|-2');
      expect(actual).assertEqual('6|3|-2');
      expect(actual.split('|')[1]).assertEqual('3');
      expect(actual.split('|')[2]).assertEqual('-2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0004 end');
    })

    /**
     * @tc.name   testEdgeReal0005
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0005
     * @tc.desc   a single row seed grows to two rows on a head insertion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0005 begin');
      const actual: string = runDataSourceAdd(1, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|0|0');
      expect(actual).assertEqual('2|0|0');
      expect(actual.split('|')[0]).assertEqual('2');
      expect(actual.startsWith('2|0|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0005 end');
    })

    /**
     * @tc.name   testEdgeReal0006
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0006
     * @tc.desc   a single row seed grows to two rows on a tail insertion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0006 begin');
      const actual: string = runDataSourceAdd(1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|1|1');
      expect(actual).assertEqual('2|1|1');
      expect(actual.split('|')[0]).assertEqual('2');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0006 end');
    })

    /**
     * @tc.name   testEdgeReal0007
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0007
     * @tc.desc   Anchor: two pushes on one row report tail 9101 and index 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0007 begin');
      const actual: string = runDataSourcePush(1, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9101|2|2');
      expect(actual).assertEqual('3|9101|2|2');
      expect(actual.split('|')[2]).assertEqual('2');
      expect(actual.split('|')[3]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0007 end');
    })

    /**
     * @tc.name   testEdgeReal0008
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0008
     * @tc.desc   four pushes on three rows report last index 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0008 begin');
      const actual: string = runDataSourcePush(3, 4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7|9103|4|6');
      expect(actual).assertEqual('7|9103|4|6');
      expect(Number(actual.split('|')[0]) - 3).assertEqual(4);
      expect(actual.split('|')[3]).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0008 end');
    })

    /**
     * @tc.name   testEdgeReal0009
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0009
     * @tc.desc   three pushes on an empty seed grow the source to three rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0009 begin');
      const actual: string = runDataSourcePush(0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3|9102|3|2');
      expect(actual).assertEqual('3|9102|3|2');
      expect(actual.split('|')[1]).assertEqual('9102');
      expect(actual.split('|')[2]).assertEqual(actual.split('|')[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0009 end');
    })

    /**
     * @tc.name   testEdgeReal0010
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0010
     * @tc.desc   a push on a 24 row seed reports 25 rows and index 24
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0010 begin');
      const actual: string = runDataSourcePush(24, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '25|9100|1|24');
      expect(actual).assertEqual('25|9100|1|24');
      expect(actual.split('|')[3]).assertEqual('24');
      expect(actual.split('|')[0]).assertEqual('25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0010 end');
    })

    /**
     * @tc.name   testEdgeReal0011
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0011
     * @tc.desc   Anchor: index 23 is the last row of a 24 row seed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0011 begin');
      const actual: string = runDataSourceIndex(24, 23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7023|seed_23');
      expect(actual).assertEqual('7023|seed_23');
      expect(actual.split('|')[0]).assertEqual('7023');
      expect(actual.endsWith('seed_23')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0011 end');
    })

    /**
     * @tc.name   testEdgeReal0012
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0012
     * @tc.desc   index 24 of a 24 row seed is out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0012 begin');
      const actual: string = runDataSourceIndex(24, 24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === runDataSourceIndex(24, 23)).assertFalse();
      expect(actual.split('|').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0012 end');
    })

    /**
     * @tc.name   testEdgeReal0013
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0013
     * @tc.desc   a single row seed exposes only index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0013 begin');
      const actual: string = runDataSourceIndex(1, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7000|seed_0');
      expect(actual).assertEqual('7000|seed_0');
      expect(actual).assertEqual(runDataSourceIndex(100, 0));
      expect(actual === runDataSourceIndex(1, 1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0013 end');
    })

    /**
     * @tc.name   testEdgeReal0014
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0014
     * @tc.desc   the last row of a 100 row seed keeps the arithmetic id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0014 begin');
      const actual: string = runDataSourceIndex(100, 99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '7099|seed_99');
      expect(actual).assertEqual('7099|seed_99');
      expect(actual.split('|')[0]).assertEqual('7099');
      expect(actual.endsWith('seed_99')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0014 end');
    })

    /**
     * @tc.name   testEdgeReal0015
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0015
     * @tc.desc   Anchor: head insertion plus three pushes keeps four notifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0015 begin');
      const actual: string = runDataSourceMixed(5, 0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '9|9000|9102|4');
      expect(actual).assertEqual('9|9000|9102|4');
      expect(actual.split('|')[1]).assertEqual('9000');
      expect(actual.split('|')[3]).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0015 end');
    })

    /**
     * @tc.name   testEdgeReal0016
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0016
     * @tc.desc   tail insertion plus two pushes keeps the seeded head
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0016 begin');
      const actual: string = runDataSourceMixed(5, 5, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '8|7000|9101|3');
      expect(actual).assertEqual('8|7000|9101|3');
      expect(actual.split('|')[1]).assertEqual('7000');
      expect(actual.split('|')[2]).assertEqual('9101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0016 end');
    })

    /**
     * @tc.name   testEdgeReal0017
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0017
     * @tc.desc   an empty source accepts an insert and a push in one run
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0017 begin');
      const actual: string = runDataSourceMixed(0, 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2|9000|9100|2');
      expect(actual).assertEqual('2|9000|9100|2');
      expect(actual.split('|')[1]).assertEqual('9000');
      expect(actual.split('|')[2]).assertEqual('9100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0017 end');
    })

    /**
     * @tc.name   testEdgeReal0018
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0018
     * @tc.desc   a middle insertion plus one push keeps the seeded head
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0018 begin');
      const actual: string = runDataSourceMixed(4, 2, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '6|7000|9100|2');
      expect(actual).assertEqual('6|7000|9100|2');
      expect(actual.split('|')[0]).assertEqual('6');
      expect(actual.split('|')[3]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0018 end');
    })

    /**
     * @tc.name   testEdgeReal0019
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0019
     * @tc.desc   two pushes after a tail insert keep the push order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0019 begin');
      const actual: string = runDataSourceMixed(2, 2, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '5|7000|9101|3');
      expect(actual).assertEqual('5|7000|9101|3');
      expect(actual.split('|')[2]).assertEqual('9101');
      expect(actual.split('|')[3]).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0019 end');
    })

    /**
     * @tc.name   testEdgeReal0020
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0020
     * @tc.desc   Anchor: the mixed snapshot agrees with the separate runs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0020 begin');
      const mixedTotal: number = Number(runDataSourceMixed(2, 2, 2).split('|')[0]);
      const addTotal: number = Number(runDataSourceAdd(2, 2).split('|')[0]);
      const pushTotal: number = Number(runDataSourcePush(2, 2).split('|')[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', mixedTotal,
        addTotal + pushTotal - 2);
      expect(mixedTotal).assertEqual(5);
      expect(addTotal).assertEqual(3);
      expect(pushTotal).assertEqual(4);
      expect(mixedTotal).assertEqual(addTotal + pushTotal - 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0020 end');
    })

    /**
     * @tc.name   testEdgeReal0021
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0021
     * @tc.desc   Anchor: the first listener is always registered even with count 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0021 begin');
      const actual: string = runListenerNotify('add', 0, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|0|-1|-1');
      expect(actual).assertEqual('1|0|0|0|-1|-1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0021 end');
    })

    /**
     * @tc.name   testEdgeReal0022
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0022
     * @tc.desc   a listener count above three saturates at three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0022 begin');
      const actual: string = runListenerNotify('add', 1, 4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|1|-1|-1');
      expect(actual).assertEqual(runListenerNotify('add', 1, 3));
      expect(actual.split('|')[2]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0022 end');
    })

    /**
     * @tc.name   testEdgeReal0023
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0023
     * @tc.desc   a move notification forwards from and to as index and index + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0023 begin');
      const actual: string = runListenerNotify('move', 3, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|3|4');
      expect(actual).assertEqual('1|0|0|-1|3|4');
      expect(actual.split('|')[4]).assertEqual('3');
      expect(actual.split('|')[5]).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0023 end');
    })

    /**
     * @tc.name   testEdgeReal0024
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0024
     * @tc.desc   a move from index 0 forwards 0 and 1 to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0024 begin');
      const actual: string = runListenerNotify('move', 0, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|0|1');
      expect(actual).assertEqual('1|1|0|-1|0|1');
      expect(actual.split('|')[4]).assertEqual('0');
      expect(actual.split('|')[5]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0024 end');
    })

    /**
     * @tc.name   testEdgeReal0025
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0025
     * @tc.desc   a move at index 100 reaches three listeners with raw indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0025 begin');
      const actual: string = runListenerNotify('move', 100, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|100|101');
      expect(actual).assertEqual('1|1|1|-1|100|101');
      expect(actual.split('|')[4]).assertEqual('100');
      expect(Number(actual.split('|')[5]) - Number(actual.split('|')[4])).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0025 end');
    })

    /**
     * @tc.name   testEdgeReal0026
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0026
     * @tc.desc   a delete with the largest safe index is forwarded untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0026 begin');
      const actual: string = runListenerNotify('delete', Number.MAX_SAFE_INTEGER, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, MAX_INDEX);
      expect(actual).assertEqual('1|1|0|' + MAX_INDEX + '|-1|-1');
      expect(actual.split('|')[3]).assertEqual(MAX_INDEX);
      expect(actual.split('|')[2]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0026 end');
    })

    /**
     * @tc.name   testEdgeReal0027
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0027
     * @tc.desc   a delete with index -1 is forwarded and counted once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0027 begin');
      const actual: string = runListenerNotify('delete', -1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
      expect(actual).assertEqual('1|0|0|-1|-1|-1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0027 end');
    })

    /**
     * @tc.name   testEdgeReal0028
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0028
     * @tc.desc   an add with the largest safe index reaches three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0028 begin');
      const actual: string = runListenerNotify('add', Number.MAX_SAFE_INTEGER, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, MAX_INDEX);
      expect(actual).assertEqual('1|1|1|' + MAX_INDEX + '|-1|-1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[2]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0028 end');
    })

    /**
     * @tc.name   testEdgeReal0029
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0029
     * @tc.desc   Anchor: a reload ignores the index argument it was given
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testEdgeReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0029 begin');
      const actual: string = runListenerNotify('reload', 42, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
      expect(actual).assertEqual('1|0|0|-1|-1|-1');
      expect(actual).assertEqual(runListenerNotify('reload', 0, 1));
      expect(actual.indexOf('42')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0029 end');
    })

    /**
     * @tc.name   testEdgeReal0030
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0030
     * @tc.desc   an unknown notification kind reaches no listener at all
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0030 begin');
      const actual: string = runListenerNotify('noop', 0, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
      expect(actual).assertEqual('0|0|0|-1|-1|-1');
      expect(actual.split('|')[0]).assertEqual('0');
      expect(actual === runListenerNotify('add', 0, 2)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0030 end');
    })

    /**
     * @tc.name   testEdgeReal0031
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0031
     * @tc.desc   a change at index 9 is forwarded to a single listener
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0031 begin');
      const actual: string = runListenerNotify('change', 9, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9|-1|-1');
      expect(actual).assertEqual('1|0|0|9|-1|-1');
      expect(actual.split('|')[3]).assertEqual('9');
      expect(actual.endsWith('-1|-1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0031 end');
    })

    /**
     * @tc.name   testEdgeReal0032
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0032
     * @tc.desc   a change at index -9 is forwarded to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0032 begin');
      const actual: string = runListenerNotify('change', -9, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-9|-1|-1');
      expect(actual).assertEqual('1|1|0|-9|-1|-1');
      expect(actual.split('|')[3]).assertEqual('-9');
      expect(actual.split('|')[1]).assertEqual(actual.split('|')[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0032 end');
    })

    /**
     * @tc.name   testEdgeReal0033
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0033
     * @tc.desc   the probe seed length mirrors the frozen song table size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0033 begin');
      const seeded: string = runDataSourcePush(SONG_COUNT, 0).split('|')[0];
      const table: string = runSongStats('count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', seeded, table);
      expect(seeded).assertEqual('24');
      expect(seeded).assertEqual(table);
      expect(seeded).assertEqual(SONG_COUNT.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0033 end');
    })

    /**
     * @tc.name   testEdgeReal0034
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0034
     * @tc.desc   the seeded ids advance by one per row from head to tail
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0034 begin');
      const head: number = Number(runDataSourceIndex(24, 0).split('|')[0]);
      const tail: number = Number(runDataSourceIndex(24, 23).split('|')[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', tail - head, 23);
      expect(head).assertEqual(7000);
      expect(tail).assertEqual(7023);
      expect(tail - head).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0034 end');
    })

    /**
     * @tc.name   testEdgeReal0035
     * @tc.number SUB_MUSICALBUM_EDGE_REAL_0035
     * @tc.desc   Anchor: appending to a 24 row seed reports the 25th row index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEdgeReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0035 begin');
      const snapshot: string = runDataSourceAdd(SONG_COUNT, SONG_COUNT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', snapshot, '25|24|24');
      expect(snapshot).assertEqual('25|24|24');
      expect(snapshot.split('|')[0]).assertEqual(String(SONG_COUNT + 1));
      expect(snapshot.split('|')[1]).assertEqual(snapshot.split('|')[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEdgeReal0035 end');
    })

  })
}
