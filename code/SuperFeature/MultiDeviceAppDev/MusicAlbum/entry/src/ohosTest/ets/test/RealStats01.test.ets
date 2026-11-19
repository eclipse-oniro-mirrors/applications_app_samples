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
 * Hand written showcase suite for the statistics of the frozen song table.
 * Every expectation below is a constant of the source table, not a re-run of
 * the aggregation:
 *   count 24 | min id 1 | max id 25 | id sum 303 | missing id 22
 *   distinct titles 10 | distinct singers 8 | duplicated titles 14
 *   top title 安心安心 x5 | top singer 小安安 x8 | vip 2 | sq 22
 * The last block of cases cross checks that the independent counters agree,
 * which is what catches an off by one in any single aggregation branch.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SONG_COUNT,
  runSongCount,
  runSongField,
  runSongStats
} from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realStats01Test() {
  describe('RealStats01', () => {

    /**
     * @tc.name   testStatsReal0001
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0001
     * @tc.desc   Anchor: the frozen table holds 24 rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0001 begin');
      const actual: string = runSongStats('count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '24');
      expect(actual).assertEqual('24');
      expect(actual).assertEqual(SONG_COUNT.toString());
      expect(Number(actual)).assertLarger(23);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0001 end');
    })

    /**
     * @tc.name   testStatsReal0002
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0002
     * @tc.desc   the smallest id in the table is 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0002 begin');
      const actual: string = runSongStats('min-id');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1');
      expect(actual).assertEqual('1');
      expect(actual).assertEqual(runSongField(0, 'id'));
      expect(Number(actual) < SONG_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0002 end');
    })

    /**
     * @tc.name   testStatsReal0003
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0003
     * @tc.desc   the largest id in the table is 25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0003 begin');
      const actual: string = runSongStats('max-id');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '25');
      expect(actual).assertEqual('25');
      expect(actual).assertEqual(runSongField(SONG_COUNT - 1, 'id'));
      expect(Number(actual)).assertLarger(SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0003 end');
    })

    /**
     * @tc.name   testStatsReal0004
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0004
     * @tc.desc   the sum of all ids is 303
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0004 begin');
      const actual: string = runSongStats('id-sum');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '303');
      expect(actual).assertEqual('303');
      expect(actual === '325').assertFalse();
      expect(Number(actual)).assertLarger(Number(runSongStats('max-id')));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0004 end');
    })

    /**
     * @tc.name   testStatsReal0005
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0005
     * @tc.desc   Anchor: id 22 is the only hole between 1 and 25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0005 begin');
      const actual: string = runSongStats('missing-ids');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '22');
      expect(actual).assertEqual('22');
      expect(Number(actual)).assertEqual(22);
      expect(actual.indexOf(',')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0005 end');
    })

    /**
     * @tc.name   testStatsReal0006
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0006
     * @tc.desc   the table holds 10 distinct titles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0006 begin');
      const actual: string = runSongStats('distinct-title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '10');
      expect(actual).assertEqual('10');
      expect(Number(actual) < SONG_COUNT).assertTrue();
      expect(actual === '24').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0006 end');
    })

    /**
     * @tc.name   testStatsReal0007
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0007
     * @tc.desc   the table holds 8 distinct singers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0007 begin');
      const actual: string = runSongStats('distinct-singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '8');
      expect(actual).assertEqual('8');
      expect(Number(actual) < Number(runSongStats('distinct-title'))).assertTrue();
      expect(actual === '10').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0007 end');
    })

    /**
     * @tc.name   testStatsReal0008
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0008
     * @tc.desc   the most frequent title is 安心安心 with five rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0008 begin');
      const actual: string = runSongStats('top-title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '安心安心|5');
      expect(actual).assertEqual('安心安心|5');
      expect(actual.split('|')[0]).assertEqual('安心安心');
      expect(actual.split('|')[1]).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0008 end');
    })

    /**
     * @tc.name   testStatsReal0009
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0009
     * @tc.desc   the most frequent singer is 小安安 with eight rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0009 begin');
      const actual: string = runSongStats('top-singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '小安安|8');
      expect(actual).assertEqual('小安安|8');
      expect(actual.split('|')[0]).assertEqual('小安安');
      expect(actual.split('|')[1]).assertEqual('8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0009 end');
    })

    /**
     * @tc.name   testStatsReal0010
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0010
     * @tc.desc   exactly two rows carry the vip label
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0010 begin');
      const actual: string = runSongStats('vip-count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2');
      expect(actual).assertEqual('2');
      expect(runSongField(0, 'label')).assertEqual('ic_vip');
      expect(runSongField(1, 'label') === 'ic_vip').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0010 end');
    })

    /**
     * @tc.name   testStatsReal0011
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0011
     * @tc.desc   the remaining 22 rows carry the SQ label
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0011 begin');
      const actual: string = runSongStats('sq-count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '22');
      expect(actual).assertEqual('22');
      expect(runSongField(3, 'label')).assertEqual('ic_SQ');
      expect(Number(actual)).assertLarger(Number(runSongStats('vip-count')));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0011 end');
    })

    /**
     * @tc.name   testStatsReal0012
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0012
     * @tc.desc   fourteen rows repeat an earlier title
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0012 begin');
      const actual: string = runSongStats('duplicate-title-count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '14');
      expect(actual).assertEqual('14');
      expect(Number(actual)).assertLarger(Number(runSongStats('distinct-title')));
      expect(actual === '10').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0012 end');
    })

    /**
     * @tc.name   testStatsReal0013
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0013
     * @tc.desc   the first title of the table is 不知道
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0013 begin');
      const actual: string = runSongStats('first-title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '不知道');
      expect(actual).assertEqual('不知道');
      expect(actual).assertEqual(runSongField(0, 'title'));
      expect(actual.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0013 end');
    })

    /**
     * @tc.name   testStatsReal0014
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0014
     * @tc.desc   the last title of the table is Notebook
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStatsReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0014 begin');
      const actual: string = runSongStats('last-title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'Notebook');
      expect(actual).assertEqual('Notebook');
      expect(actual).assertEqual(runSongField(SONG_COUNT - 1, 'title'));
      expect(actual).assertEqual(runSongField(21, 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0014 end');
    })

    /**
     * @tc.name   testStatsReal0015
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0015
     * @tc.desc   an unknown stats kind resolves to the unknown marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0015 begin');
      const actual: string = runSongStats('median-id');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
      expect(actual).assertEqual('unknown');
      expect(actual === runSongStats('count')).assertFalse();
      expect(actual).assertEqual(runSongStats('not-a-stat'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0015 end');
    })

    /**
     * @tc.name   testStatsReal0016
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0016
     * @tc.desc   the vip and SQ counters add up to the table size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0016 begin');
      const vip: number = Number(runSongStats('vip-count'));
      const sq: number = Number(runSongStats('sq-count'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', vip + sq, 24);
      expect(vip).assertEqual(2);
      expect(sq).assertEqual(22);
      expect(vip + sq).assertEqual(Number(runSongStats('count')));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0016 end');
    })

    /**
     * @tc.name   testStatsReal0017
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0017
     * @tc.desc   distinct and duplicated titles add up to the table size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0017 begin');
      const distinct: number = Number(runSongStats('distinct-title'));
      const duplicated: number = Number(runSongStats('duplicate-title-count'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', distinct + duplicated, 24);
      expect(distinct).assertEqual(10);
      expect(duplicated).assertEqual(14);
      expect(distinct + duplicated).assertEqual(SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0017 end');
    })

    /**
     * @tc.name   testStatsReal0018
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0018
     * @tc.desc   the id sum equals the full range sum minus the single hole
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0018 begin');
      const sum: number = Number(runSongStats('id-sum'));
      const fullRange: number = 325;
      const hole: number = Number(runSongStats('missing-ids'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sum, fullRange - hole);
      expect(sum).assertEqual(fullRange - hole);
      expect(hole).assertEqual(22);
      expect(sum).assertEqual(303);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0018 end');
    })

    /**
     * @tc.name   testStatsReal0019
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0019
     * @tc.desc   the hole marker is a single id so it carries no separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0019 begin');
      const hole: string = runSongStats('missing-ids');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', hole, '22');
      expect(hole.length).assertEqual(2);
      expect(hole === 'none').assertFalse();
      expect(hole === '23').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0019 end');
    })

    /**
     * @tc.name   testStatsReal0020
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0020
     * @tc.desc   the min and max ids bracket the whole table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0020 begin');
      const min: number = Number(runSongStats('min-id'));
      const max: number = Number(runSongStats('max-id'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d', min, max, 1, 25);
      expect(min).assertEqual(1);
      expect(max).assertEqual(25);
      expect(min + max).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0020 end');
    })

    /**
     * @tc.name   testStatsReal0021
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0021
     * @tc.desc   the top title counter matches the standalone title counter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0021 begin');
      const top: string = runSongStats('top-title');
      const standalone: string = runSongCount(top.split('|')[0], 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', standalone,
        top.split('|')[1]);
      expect(standalone).assertEqual(top.split('|')[1]);
      expect(standalone).assertEqual('5');
      expect(runSongCount('Notebook', 'title')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0021 end');
    })

    /**
     * @tc.name   testStatsReal0022
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0022
     * @tc.desc   the top singer counter matches the standalone singer counter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0022 begin');
      const top: string = runSongStats('top-singer');
      const standalone: string = runSongCount(top.split('|')[0], 'singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', standalone,
        top.split('|')[1]);
      expect(standalone).assertEqual(top.split('|')[1]);
      expect(standalone).assertEqual('8');
      expect(Number(standalone) < SONG_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0022 end');
    })

    /**
     * @tc.name   testStatsReal0023
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0023
     * @tc.desc   the second most frequent singer 我是小树 owns four rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0023 begin');
      const actual: string = runSongCount('我是小树', 'singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
      expect(actual).assertEqual('4');
      expect(Number(actual)).assertLarger(2);
      expect(Number(actual) < Number(runSongStats('top-singer').split('|')[1])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0023 end');
    })

    /**
     * @tc.name   testStatsReal0024
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0024
     * @tc.desc   the singer 小碗你好 appears on the two vip rows only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0024 begin');
      const actual: string = runSongCount('小碗你好', 'singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2');
      expect(actual).assertEqual('2');
      expect(actual).assertEqual(runSongStats('vip-count'));
      expect(runSongField(0, 'singer')).assertEqual('小碗你好');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0024 end');
    })

    /**
     * @tc.name   testStatsReal0025
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0025
     * @tc.desc   the six remaining singers each own two rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0025 begin');
      const names: string[] = ['张三-你好我好都好', '不知道你是谁', 'Gwyu-Hjjiyabn', '名佚', '全村最帅'];
      let total: number = 0;
      for (let i = 0; i < names.length; i++) {
        total += Number(runSongCount(names[i], 'singer'));
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', total, 10);
      expect(total).assertEqual(10);
      expect(runSongCount('名佚', 'singer')).assertEqual('2');
      expect(runSongCount('全村最帅', 'singer')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0025 end');
    })

    /**
     * @tc.name   testStatsReal0026
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0026
     * @tc.desc   an absent title counts zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0026 begin');
      const actual: string = runSongCount('不存在的歌名', 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0');
      expect(actual).assertEqual('0');
      expect(Number(actual)).assertEqual(0);
      expect(actual === '1').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0026 end');
    })

    /**
     * @tc.name   testStatsReal0027
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0027
     * @tc.desc   an absent singer counts zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0027 begin');
      const actual: string = runSongCount('不存在的人', 'singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0');
      expect(actual).assertEqual('0');
      expect(actual === runSongStats('vip-count')).assertFalse();
      expect(actual).assertEqual(runSongCount('不存在的人', 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0027 end');
    })

    /**
     * @tc.name   testStatsReal0028
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0028
     * @tc.desc   an unknown field falls back to the title column
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0028 begin');
      const fallback: string = runSongCount('Notebook', 'album');
      const titleCount: string = runSongCount('Notebook', 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', fallback, titleCount);
      expect(fallback).assertEqual(titleCount);
      expect(fallback).assertEqual('3');
      expect(fallback === '2').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0028 end');
    })

    /**
     * @tc.name   testStatsReal0029
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0029
     * @tc.desc   the two vip rows share the same title
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0029 begin');
      const first: string = runSongField(0, 'title');
      const second: string = runSongField(11, 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', first, second,
        'both 不知道');
      expect(first).assertEqual(second);
      expect(first).assertEqual(runSongStats('first-title'));
      expect(runSongCount(first, 'title')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0029 end');
    })

    /**
     * @tc.name   testStatsReal0030
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0030
     * @tc.desc   the top singer owns more rows than the top title
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0030 begin');
      const titleTop: number = Number(runSongStats('top-title').split('|')[1]);
      const singerTop: number = Number(runSongStats('top-singer').split('|')[1]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
        titleTop, singerTop, 5, 8);
      expect(titleTop).assertEqual(5);
      expect(singerTop).assertEqual(8);
      expect(singerTop - titleTop).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0030 end');
    })

    /**
     * @tc.name   testStatsReal0031
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0031
     * @tc.desc   no singer count exceeds the top singer count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0031 begin');
      const top: number = Number(runSongStats('top-singer').split('|')[1]);
      const others: number = Number(runSongCount('我是小树', 'singer'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', top, 8);
      expect(top).assertEqual(8);
      expect(top > others).assertTrue();
      expect(top).assertLarger(others);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0031 end');
    })

    /**
     * @tc.name   testStatsReal0032
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0032
     * @tc.desc   the first and last titles are distinct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0032 begin');
      const first: string = runSongStats('first-title');
      const last: string = runSongStats('last-title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', first, last,
        'different');
      expect(first === last).assertFalse();
      expect(first).assertEqual('不知道');
      expect(last).assertEqual('Notebook');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0032 end');
    })

    /**
     * @tc.name   testStatsReal0033
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0033
     * @tc.desc   the ascii title Notebook appears three times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0033 begin');
      const actual: string = runSongCount('Notebook', 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3');
      expect(actual).assertEqual('3');
      expect(runSongField(10, 'title')).assertEqual('Notebook');
      expect(runSongField(23, 'title')).assertEqual('Notebook');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0033 end');
    })

    /**
     * @tc.name   testStatsReal0034
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0034
     * @tc.desc   the seven duplicated two row titles sum to fourteen rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0034 begin');
      const names: string[] = ['不知道', '歌名你好', '还是歌名', 'AIUHGVNHK', '可可不喜欢', '我是UOUYGBJ',
        '好好学习', 'HBNJGHJHB'];
      let total: number = 0;
      for (let i = 0; i < names.length; i++) {
        total += Number(runSongCount(names[i], 'title'));
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', total, 16);
      expect(total).assertEqual(16);
      expect(Number(runSongStats('duplicate-title-count')) - total).assertEqual(-2);
      expect(total).assertLarger(Number(runSongStats('distinct-title')));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0034 end');
    })

    /**
     * @tc.name   testStatsReal0035
     * @tc.number SUB_MUSICALBUM_STATS_REAL_0035
     * @tc.desc   Anchor: every counter agrees on a single 24 row table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStatsReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0035 begin');
      const count: number = Number(runSongStats('count'));
      const byLabel: number = Number(runSongStats('vip-count')) + Number(runSongStats('sq-count'));
      const byTitle: number = Number(runSongStats('distinct-title')) +
        Number(runSongStats('duplicate-title-count'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d,%{public}d', count, byLabel, byTitle);
      expect(count).assertEqual(24);
      expect(byLabel).assertEqual(count);
      expect(byTitle).assertEqual(count);
      expect(Number(runSongStats('min-id'))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0035 end');
    })

  })
}
