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
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SONG_COUNT,
  runSongCount,
  runSongField,
  runSongStats
} from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realStats01Test(): void {
  describe('RealStats01Test', () => {

    /*
     * @tc.number: SUB_REAL_STATS_01_0100
     * @tc.name: testStatsReal0001
     * @tc.desc: Verify the frozen table holds 24 rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0001', 0, async (done: Function) => {
      await runCase('testStatsReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0001 begin');
        const actual: string = runSongStats('count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '24');
        logAssertion(DOMAIN, TAG, String(actual), String('24'));
        expect(actual).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(actual), String(SONG_COUNT.toString()));
        expect(actual).assertEqual(SONG_COUNT.toString());
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(23));
        expect(Number(actual)).assertLarger(23);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0200
     * @tc.name: testStatsReal0002
     * @tc.desc: Verify the smallest id in the table is 1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0002', 0, async (done: Function) => {
      await runCase('testStatsReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0002 begin');
        const actual: string = runSongStats('min-id');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1');
        logAssertion(DOMAIN, TAG, String(actual), String('1'));
        expect(actual).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(0, 'id')));
        expect(actual).assertEqual(runSongField(0, 'id'));
        logAssertion(DOMAIN, TAG, String(Number(actual) < SONG_COUNT), 'true');
        expect(Number(actual) < SONG_COUNT).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0300
     * @tc.name: testStatsReal0003
     * @tc.desc: Verify the largest id in the table is 25
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0003', 0, async (done: Function) => {
      await runCase('testStatsReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0003 begin');
        const actual: string = runSongStats('max-id');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '25');
        logAssertion(DOMAIN, TAG, String(actual), String('25'));
        expect(actual).assertEqual('25');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(SONG_COUNT - 1, 'id')));
        expect(actual).assertEqual(runSongField(SONG_COUNT - 1, 'id'));
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(SONG_COUNT));
        expect(Number(actual)).assertLarger(SONG_COUNT);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0400
     * @tc.name: testStatsReal0004
     * @tc.desc: Verify the sum of all ids is 303
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0004', 0, async (done: Function) => {
      await runCase('testStatsReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0004 begin');
        const actual: string = runSongStats('id-sum');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '303');
        logAssertion(DOMAIN, TAG, String(actual), String('303'));
        expect(actual).assertEqual('303');
        logAssertion(DOMAIN, TAG, String(actual === '325'), 'false');
        expect(actual === '325').assertFalse();
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(Number(runSongStats('max-id'))));
        expect(Number(actual)).assertLarger(Number(runSongStats('max-id')));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0500
     * @tc.name: testStatsReal0005
     * @tc.desc: Verify id 22 is the only hole between 1 and 25
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0005', 0, async (done: Function) => {
      await runCase('testStatsReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0005 begin');
        const actual: string = runSongStats('missing-ids');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '22');
        logAssertion(DOMAIN, TAG, String(actual), String('22'));
        expect(actual).assertEqual('22');
        logAssertion(DOMAIN, TAG, String(Number(actual)), String(22));
        expect(Number(actual)).assertEqual(22);
        logAssertion(DOMAIN, TAG, String(actual.indexOf(',')), String(-1));
        expect(actual.indexOf(',')).assertEqual(-1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0600
     * @tc.name: testStatsReal0006
     * @tc.desc: Verify the table holds 10 distinct titles
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0006', 0, async (done: Function) => {
      await runCase('testStatsReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0006 begin');
        const actual: string = runSongStats('distinct-title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '10');
        logAssertion(DOMAIN, TAG, String(actual), String('10'));
        expect(actual).assertEqual('10');
        logAssertion(DOMAIN, TAG, String(Number(actual) < SONG_COUNT), 'true');
        expect(Number(actual) < SONG_COUNT).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual === '24'), 'false');
        expect(actual === '24').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0700
     * @tc.name: testStatsReal0007
     * @tc.desc: Verify the table holds 8 distinct singers
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0007', 0, async (done: Function) => {
      await runCase('testStatsReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0007 begin');
        const actual: string = runSongStats('distinct-singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '8');
        logAssertion(DOMAIN, TAG, String(actual), String('8'));
        expect(actual).assertEqual('8');
        logAssertion(DOMAIN, TAG, String(Number(actual) < Number(runSongStats('distinct-title'))), 'true');
        expect(Number(actual) < Number(runSongStats('distinct-title'))).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual === '10'), 'false');
        expect(actual === '10').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0800
     * @tc.name: testStatsReal0008
     * @tc.desc: Verify the most frequent title is 安心安心 with five rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0008', 0, async (done: Function) => {
      await runCase('testStatsReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0008 begin');
        const actual: string = runSongStats('top-title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '安心安心|5');
        logAssertion(DOMAIN, TAG, String(actual), String('安心安心|5'));
        expect(actual).assertEqual('安心安心|5');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('安心安心'));
        expect(actual.split('|')[0]).assertEqual('安心安心');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('5'));
        expect(actual.split('|')[1]).assertEqual('5');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_0900
     * @tc.name: testStatsReal0009
     * @tc.desc: Verify the most frequent singer is 小安安 with eight rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0009', 0, async (done: Function) => {
      await runCase('testStatsReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0009 begin');
        const actual: string = runSongStats('top-singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '小安安|8');
        logAssertion(DOMAIN, TAG, String(actual), String('小安安|8'));
        expect(actual).assertEqual('小安安|8');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('小安安'));
        expect(actual.split('|')[0]).assertEqual('小安安');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('8'));
        expect(actual.split('|')[1]).assertEqual('8');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1000
     * @tc.name: testStatsReal0010
     * @tc.desc: Verify exactly two rows carry the vip label
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0010', 0, async (done: Function) => {
      await runCase('testStatsReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0010 begin');
        const actual: string = runSongStats('vip-count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2');
        logAssertion(DOMAIN, TAG, String(actual), String('2'));
        expect(actual).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(runSongField(0, 'label')), String('ic_vip'));
        expect(runSongField(0, 'label')).assertEqual('ic_vip');
        logAssertion(DOMAIN, TAG, String(runSongField(1, 'label') === 'ic_vip'), 'false');
        expect(runSongField(1, 'label') === 'ic_vip').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1100
     * @tc.name: testStatsReal0011
     * @tc.desc: Verify the remaining 22 rows carry the SQ label
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0011', 0, async (done: Function) => {
      await runCase('testStatsReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0011 begin');
        const actual: string = runSongStats('sq-count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '22');
        logAssertion(DOMAIN, TAG, String(actual), String('22'));
        expect(actual).assertEqual('22');
        logAssertion(DOMAIN, TAG, String(runSongField(3, 'label')), String('ic_SQ'));
        expect(runSongField(3, 'label')).assertEqual('ic_SQ');
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(Number(runSongStats('vip-count'))));
        expect(Number(actual)).assertLarger(Number(runSongStats('vip-count')));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1200
     * @tc.name: testStatsReal0012
     * @tc.desc: Verify fourteen rows repeat an earlier title
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0012', 0, async (done: Function) => {
      await runCase('testStatsReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0012 begin');
        const actual: string = runSongStats('duplicate-title-count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '14');
        logAssertion(DOMAIN, TAG, String(actual), String('14'));
        expect(actual).assertEqual('14');
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(Number(runSongStats('distinct-title'))));
        expect(Number(actual)).assertLarger(Number(runSongStats('distinct-title')));
        logAssertion(DOMAIN, TAG, String(actual === '10'), 'false');
        expect(actual === '10').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1300
     * @tc.name: testStatsReal0013
     * @tc.desc: Verify the first title of the table is 不知道
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0013', 0, async (done: Function) => {
      await runCase('testStatsReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0013 begin');
        const actual: string = runSongStats('first-title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '不知道');
        logAssertion(DOMAIN, TAG, String(actual), String('不知道'));
        expect(actual).assertEqual('不知道');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(0, 'title')));
        expect(actual).assertEqual(runSongField(0, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.length), String(3));
        expect(actual.length).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1400
     * @tc.name: testStatsReal0014
     * @tc.desc: Verify the last title of the table is Notebook
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStatsReal0014', 0, async (done: Function) => {
      await runCase('testStatsReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0014 begin');
        const actual: string = runSongStats('last-title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'Notebook');
        logAssertion(DOMAIN, TAG, String(actual), String('Notebook'));
        expect(actual).assertEqual('Notebook');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(SONG_COUNT - 1, 'title')));
        expect(actual).assertEqual(runSongField(SONG_COUNT - 1, 'title'));
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(21, 'title')));
        expect(actual).assertEqual(runSongField(21, 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1500
     * @tc.name: testStatsReal0015
     * @tc.desc: Verify an unknown stats kind resolves to the unknown marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0015', 0, async (done: Function) => {
      await runCase('testStatsReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0015 begin');
        const actual: string = runSongStats('median-id');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
        logAssertion(DOMAIN, TAG, String(actual), String('unknown'));
        expect(actual).assertEqual('unknown');
        logAssertion(DOMAIN, TAG, String(actual === runSongStats('count')), 'false');
        expect(actual === runSongStats('count')).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual), String(runSongStats('not-a-stat')));
        expect(actual).assertEqual(runSongStats('not-a-stat'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1600
     * @tc.name: testStatsReal0016
     * @tc.desc: Verify the vip and SQ counters add up to the table size
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0016', 0, async (done: Function) => {
      await runCase('testStatsReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0016 begin');
        const vip: number = Number(runSongStats('vip-count'));
        const sq: number = Number(runSongStats('sq-count'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', vip + sq, 24);
        logAssertion(DOMAIN, TAG, String(vip), String(2));
        expect(vip).assertEqual(2);
        logAssertion(DOMAIN, TAG, String(sq), String(22));
        expect(sq).assertEqual(22);
        logAssertion(DOMAIN, TAG, String(vip + sq), String(Number(runSongStats('count'))));
        expect(vip + sq).assertEqual(Number(runSongStats('count')));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1700
     * @tc.name: testStatsReal0017
     * @tc.desc: Verify distinct and duplicated titles add up to the table size
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0017', 0, async (done: Function) => {
      await runCase('testStatsReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0017 begin');
        const distinct: number = Number(runSongStats('distinct-title'));
        const duplicated: number = Number(runSongStats('duplicate-title-count'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', distinct + duplicated, 24);
        logAssertion(DOMAIN, TAG, String(distinct), String(10));
        expect(distinct).assertEqual(10);
        logAssertion(DOMAIN, TAG, String(duplicated), String(14));
        expect(duplicated).assertEqual(14);
        logAssertion(DOMAIN, TAG, String(distinct + duplicated), String(SONG_COUNT));
        expect(distinct + duplicated).assertEqual(SONG_COUNT);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1800
     * @tc.name: testStatsReal0018
     * @tc.desc: Verify the id sum equals the full range sum minus the single hole
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0018', 0, async (done: Function) => {
      await runCase('testStatsReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0018 begin');
        const sum: number = Number(runSongStats('id-sum'));
        const fullRange: number = 325;
        const hole: number = Number(runSongStats('missing-ids'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sum, fullRange - hole);
        logAssertion(DOMAIN, TAG, String(sum), String(fullRange - hole));
        expect(sum).assertEqual(fullRange - hole);
        logAssertion(DOMAIN, TAG, String(hole), String(22));
        expect(hole).assertEqual(22);
        logAssertion(DOMAIN, TAG, String(sum), String(303));
        expect(sum).assertEqual(303);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_1900
     * @tc.name: testStatsReal0019
     * @tc.desc: Verify the hole marker is a single id so it carries no separator
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0019', 0, async (done: Function) => {
      await runCase('testStatsReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0019 begin');
        const hole: string = runSongStats('missing-ids');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', hole, '22');
        logAssertion(DOMAIN, TAG, String(hole.length), String(2));
        expect(hole.length).assertEqual(2);
        logAssertion(DOMAIN, TAG, String(hole === 'none'), 'false');
        expect(hole === 'none').assertFalse();
        logAssertion(DOMAIN, TAG, String(hole === '23'), 'false');
        expect(hole === '23').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2000
     * @tc.name: testStatsReal0020
     * @tc.desc: Verify the min and max ids bracket the whole table
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0020', 0, async (done: Function) => {
      await runCase('testStatsReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0020 begin');
        const min: number = Number(runSongStats('min-id'));
        const max: number = Number(runSongStats('max-id'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d', min, max, 1, 25);
        logAssertion(DOMAIN, TAG, String(min), String(1));
        expect(min).assertEqual(1);
        logAssertion(DOMAIN, TAG, String(max), String(25));
        expect(max).assertEqual(25);
        logAssertion(DOMAIN, TAG, String(min + max), String(26));
        expect(min + max).assertEqual(26);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2100
     * @tc.name: testStatsReal0021
     * @tc.desc: Verify the top title counter matches the standalone title counter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0021', 0, async (done: Function) => {
      await runCase('testStatsReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0021 begin');
        const top: string = runSongStats('top-title');
        const standalone: string = runSongCount(top.split('|')[0], 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', standalone,
          top.split('|')[1]);
        logAssertion(DOMAIN, TAG, String(standalone), String(top.split('|')[1]));
        expect(standalone).assertEqual(top.split('|')[1]);
        logAssertion(DOMAIN, TAG, String(standalone), String('5'));
        expect(standalone).assertEqual('5');
        logAssertion(DOMAIN, TAG, String(runSongCount('Notebook', 'title')), String('3'));
        expect(runSongCount('Notebook', 'title')).assertEqual('3');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2200
     * @tc.name: testStatsReal0022
     * @tc.desc: Verify the top singer counter matches the standalone singer counter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0022', 0, async (done: Function) => {
      await runCase('testStatsReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0022 begin');
        const top: string = runSongStats('top-singer');
        const standalone: string = runSongCount(top.split('|')[0], 'singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', standalone,
          top.split('|')[1]);
        logAssertion(DOMAIN, TAG, String(standalone), String(top.split('|')[1]));
        expect(standalone).assertEqual(top.split('|')[1]);
        logAssertion(DOMAIN, TAG, String(standalone), String('8'));
        expect(standalone).assertEqual('8');
        logAssertion(DOMAIN, TAG, String(Number(standalone) < SONG_COUNT), 'true');
        expect(Number(standalone) < SONG_COUNT).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2300
     * @tc.name: testStatsReal0023
     * @tc.desc: Verify the second most frequent singer 我是小树 owns four rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0023', 0, async (done: Function) => {
      await runCase('testStatsReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0023 begin');
        const actual: string = runSongCount('我是小树', 'singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
        logAssertion(DOMAIN, TAG, String(actual), String('4'));
        expect(actual).assertEqual('4');
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(2));
        expect(Number(actual)).assertLarger(2);
        logAssertion(DOMAIN, TAG, String(Number(actual) < Number(runSongStats('top-singer').split('|')[1])), 'true');
        expect(Number(actual) < Number(runSongStats('top-singer').split('|')[1])).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2400
     * @tc.name: testStatsReal0024
     * @tc.desc: Verify the singer 小碗你好 appears on the two vip rows only
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0024', 0, async (done: Function) => {
      await runCase('testStatsReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0024 begin');
        const actual: string = runSongCount('小碗你好', 'singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '2');
        logAssertion(DOMAIN, TAG, String(actual), String('2'));
        expect(actual).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongStats('vip-count')));
        expect(actual).assertEqual(runSongStats('vip-count'));
        logAssertion(DOMAIN, TAG, String(runSongField(0, 'singer')), String('小碗你好'));
        expect(runSongField(0, 'singer')).assertEqual('小碗你好');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2500
     * @tc.name: testStatsReal0025
     * @tc.desc: Verify the six remaining singers each own two rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0025', 0, async (done: Function) => {
      await runCase('testStatsReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0025 begin');
        const names: string[] = ['张三-你好我好都好', '不知道你是谁', 'Gwyu-Hjjiyabn', '名佚', '全村最帅'];
        let total: number = 0;
        for (let i = 0; i < names.length; i++) {
          total += Number(runSongCount(names[i], 'singer'));
        }
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', total, 10);
        logAssertion(DOMAIN, TAG, String(total), String(10));
        expect(total).assertEqual(10);
        logAssertion(DOMAIN, TAG, String(runSongCount('名佚', 'singer')), String('2'));
        expect(runSongCount('名佚', 'singer')).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(runSongCount('全村最帅', 'singer')), String('2'));
        expect(runSongCount('全村最帅', 'singer')).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2600
     * @tc.name: testStatsReal0026
     * @tc.desc: Verify an absent title counts zero
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0026', 0, async (done: Function) => {
      await runCase('testStatsReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0026 begin');
        const actual: string = runSongCount('不存在的歌名', 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0');
        logAssertion(DOMAIN, TAG, String(actual), String('0'));
        expect(actual).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(Number(actual)), String(0));
        expect(Number(actual)).assertEqual(0);
        logAssertion(DOMAIN, TAG, String(actual === '1'), 'false');
        expect(actual === '1').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2700
     * @tc.name: testStatsReal0027
     * @tc.desc: Verify an absent singer counts zero
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0027', 0, async (done: Function) => {
      await runCase('testStatsReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0027 begin');
        const actual: string = runSongCount('不存在的人', 'singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0');
        logAssertion(DOMAIN, TAG, String(actual), String('0'));
        expect(actual).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual === runSongStats('vip-count')), 'false');
        expect(actual === runSongStats('vip-count')).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual), String(runSongCount('不存在的人', 'title')));
        expect(actual).assertEqual(runSongCount('不存在的人', 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2800
     * @tc.name: testStatsReal0028
     * @tc.desc: Verify an unknown field falls back to the title column
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0028', 0, async (done: Function) => {
      await runCase('testStatsReal0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0028 begin');
        const fallback: string = runSongCount('Notebook', 'album');
        const titleCount: string = runSongCount('Notebook', 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', fallback, titleCount);
        logAssertion(DOMAIN, TAG, String(fallback), String(titleCount));
        expect(fallback).assertEqual(titleCount);
        logAssertion(DOMAIN, TAG, String(fallback), String('3'));
        expect(fallback).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(fallback === '2'), 'false');
        expect(fallback === '2').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_2900
     * @tc.name: testStatsReal0029
     * @tc.desc: Verify the two vip rows share the same title
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0029', 0, async (done: Function) => {
      await runCase('testStatsReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0029 begin');
        const first: string = runSongField(0, 'title');
        const second: string = runSongField(11, 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', first, second,
          'both 不知道');
        logAssertion(DOMAIN, TAG, String(first), String(second));
        expect(first).assertEqual(second);
        logAssertion(DOMAIN, TAG, String(first), String(runSongStats('first-title')));
        expect(first).assertEqual(runSongStats('first-title'));
        logAssertion(DOMAIN, TAG, String(runSongCount(first, 'title')), String('2'));
        expect(runSongCount(first, 'title')).assertEqual('2');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3000
     * @tc.name: testStatsReal0030
     * @tc.desc: Verify the top singer owns more rows than the top title
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0030', 0, async (done: Function) => {
      await runCase('testStatsReal0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0030 begin');
        const titleTop: number = Number(runSongStats('top-title').split('|')[1]);
        const singerTop: number = Number(runSongStats('top-singer').split('|')[1]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
          titleTop, singerTop, 5, 8);
        logAssertion(DOMAIN, TAG, String(titleTop), String(5));
        expect(titleTop).assertEqual(5);
        logAssertion(DOMAIN, TAG, String(singerTop), String(8));
        expect(singerTop).assertEqual(8);
        logAssertion(DOMAIN, TAG, String(singerTop - titleTop), String(3));
        expect(singerTop - titleTop).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3100
     * @tc.name: testStatsReal0031
     * @tc.desc: Verify no singer count exceeds the top singer count
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0031', 0, async (done: Function) => {
      await runCase('testStatsReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0031 begin');
        const top: number = Number(runSongStats('top-singer').split('|')[1]);
        const others: number = Number(runSongCount('我是小树', 'singer'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', top, 8);
        logAssertion(DOMAIN, TAG, String(top), String(8));
        expect(top).assertEqual(8);
        logAssertion(DOMAIN, TAG, String(top > others), 'true');
        expect(top > others).assertTrue();
        logAssertion(DOMAIN, TAG, String(top), '> ' + String(others));
        expect(top).assertLarger(others);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3200
     * @tc.name: testStatsReal0032
     * @tc.desc: Verify the first and last titles are distinct
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0032', 0, async (done: Function) => {
      await runCase('testStatsReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0032 begin');
        const first: string = runSongStats('first-title');
        const last: string = runSongStats('last-title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', first, last,
          'different');
        logAssertion(DOMAIN, TAG, String(first === last), 'false');
        expect(first === last).assertFalse();
        logAssertion(DOMAIN, TAG, String(first), String('不知道'));
        expect(first).assertEqual('不知道');
        logAssertion(DOMAIN, TAG, String(last), String('Notebook'));
        expect(last).assertEqual('Notebook');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3300
     * @tc.name: testStatsReal0033
     * @tc.desc: Verify the ascii title Notebook appears three times
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0033', 0, async (done: Function) => {
      await runCase('testStatsReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0033 begin');
        const actual: string = runSongCount('Notebook', 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '3');
        logAssertion(DOMAIN, TAG, String(actual), String('3'));
        expect(actual).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(runSongField(10, 'title')), String('Notebook'));
        expect(runSongField(10, 'title')).assertEqual('Notebook');
        logAssertion(DOMAIN, TAG, String(runSongField(23, 'title')), String('Notebook'));
        expect(runSongField(23, 'title')).assertEqual('Notebook');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3400
     * @tc.name: testStatsReal0034
     * @tc.desc: Verify the seven duplicated two row titles sum to fourteen rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0034', 0, async (done: Function) => {
      await runCase('testStatsReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0034 begin');
        const names: string[] = ['不知道', '歌名你好', '还是歌名', 'AIUHGVNHK', '可可不喜欢', '我是UOUYGBJ',
          '好好学习', 'HBNJGHJHB'];
        let total: number = 0;
        for (let i = 0; i < names.length; i++) {
          total += Number(runSongCount(names[i], 'title'));
        }
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', total, 16);
        logAssertion(DOMAIN, TAG, String(total), String(16));
        expect(total).assertEqual(16);
        logAssertion(DOMAIN, TAG, String(Number(runSongStats('duplicate-title-count')) - total), String(-2));
        expect(Number(runSongStats('duplicate-title-count')) - total).assertEqual(-2);
        logAssertion(DOMAIN, TAG, String(total), '> ' + String(Number(runSongStats('distinct-title'))));
        expect(total).assertLarger(Number(runSongStats('distinct-title')));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_STATS_01_3500
     * @tc.name: testStatsReal0035
     * @tc.desc: Verify every counter agrees on a single 24 row table
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStatsReal0035', 0, async (done: Function) => {
      await runCase('testStatsReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0035 begin');
        const count: number = Number(runSongStats('count'));
        const byLabel: number = Number(runSongStats('vip-count')) + Number(runSongStats('sq-count'));
        const byTitle: number = Number(runSongStats('distinct-title')) +
          Number(runSongStats('duplicate-title-count'));
        hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d,%{public}d', count, byLabel, byTitle);
        logAssertion(DOMAIN, TAG, String(count), String(24));
        expect(count).assertEqual(24);
        logAssertion(DOMAIN, TAG, String(byLabel), String(count));
        expect(byLabel).assertEqual(count);
        logAssertion(DOMAIN, TAG, String(byTitle), String(count));
        expect(byTitle).assertEqual(count);
        logAssertion(DOMAIN, TAG, String(Number(runSongStats('min-id'))), String(1));
        expect(Number(runSongStats('min-id'))).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testStatsReal0035 end');
      }, done);
    });

  })
}
