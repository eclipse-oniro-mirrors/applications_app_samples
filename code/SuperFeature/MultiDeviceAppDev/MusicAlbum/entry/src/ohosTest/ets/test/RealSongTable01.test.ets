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
 * Hand written showcase suite for the frozen song table in SongList.ets.
 * Frozen rules under test (verified against the literal table):
 *   - 24 rows, ids 1..21 and 23..25, so id 22 is the only hole and the sum
 *     of all ids is 303;
 *   - 10 distinct titles and 8 distinct singers, 安心安心 appears 5 times and
 *     小安安 appears 8 times;
 *   - exactly two rows carry ic_vip (index 0 and index 11), the other 22 rows
 *     carry ic_SQ;
 *   - every row keeps the literal order of the source file.
 */
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SONG_COUNT,
  runSongCount,
  runSongField,
  runSongRow,
  runSongStats
} from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realSongTable01Test(): void {
  describe('RealSongTable01Test', () => {

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0100
     * @tc.name: testTableReal0001
     * @tc.desc: Verify row 0 exposes id 1, its title, singer and the vip label
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0001', 0, async (done: Function) => {
      await runCase('testTableReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0001 begin');
        const actual: string = runSongRow(0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|不知道|小碗你好|ic_vip');
        logAssertion(DOMAIN, TAG, String(actual), String('1|不知道|小碗你好|ic_vip'));
        expect(actual).assertEqual('1|不知道|小碗你好|ic_vip');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('|ic_vip')), 'true');
        expect(actual.endsWith('|ic_vip')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0200
     * @tc.name: testTableReal0002
     * @tc.desc: Verify row 1 exposes the long singer name and the SQ label
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0002', 0, async (done: Function) => {
      await runCase('testTableReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0002 begin');
        const actual: string = runSongRow(1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '2|歌名你好|张三-你好我好都好|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('2|歌名你好|张三-你好我好都好|ic_SQ'));
        expect(actual).assertEqual('2|歌名你好|张三-你好我好都好|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('歌名你好'));
        expect(actual.split('|')[1]).assertEqual('歌名你好');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('ic_SQ'));
        expect(actual.split('|')[3]).assertEqual('ic_SQ');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0300
     * @tc.name: testTableReal0003
     * @tc.desc: Verify row 2 exposes a sentence shaped singer name
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0003', 0, async (done: Function) => {
      await runCase('testTableReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0003 begin');
        const actual: string = runSongRow(2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '3|还是歌名|不知道你是谁|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('3|还是歌名|不知道你是谁|ic_SQ'));
        expect(actual).assertEqual('3|还是歌名|不知道你是谁|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('不知道你是谁'));
        expect(actual.split('|')[2]).assertEqual('不知道你是谁');
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(4));
        expect(actual.split('|').length).assertEqual(4);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0400
     * @tc.name: testTableReal0004
     * @tc.desc: Verify row 3 keeps the upper case ascii title and the hyphenated singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0004', 0, async (done: Function) => {
      await runCase('testTableReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0004 begin');
        const actual: string = runSongRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '4|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('4|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ'));
        expect(actual).assertEqual('4|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('AIUHGVNHK'));
        expect(actual.split('|')[1]).assertEqual('AIUHGVNHK');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('4|')), 'true');
        expect(actual.startsWith('4|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0500
     * @tc.name: testTableReal0005
     * @tc.desc: Verify row 4 exposes the three character title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0005', 0, async (done: Function) => {
      await runCase('testTableReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0005 begin');
        const actual: string = runSongRow(4);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '5|可可不喜欢|名佚|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('5|可可不喜欢|名佚|ic_SQ'));
        expect(actual).assertEqual('5|可可不喜欢|名佚|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('名佚'));
        expect(actual.split('|')[2]).assertEqual('名佚');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('ic_SQ'));
        expect(actual.split('|')[3]).assertEqual('ic_SQ');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0600
     * @tc.name: testTableReal0006
     * @tc.desc: Verify row 5 exposes the mixed case title and the 我是小树 singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0006', 0, async (done: Function) => {
      await runCase('testTableReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0006 begin');
        const actual: string = runSongRow(5);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '6|我是UOUYGBJ|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('6|我是UOUYGBJ|我是小树|ic_SQ'));
        expect(actual).assertEqual('6|我是UOUYGBJ|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('我是小树'));
        expect(actual.split('|')[2]).assertEqual('我是小树');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('6'));
        expect(actual.split('|')[0]).assertEqual('6');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0700
     * @tc.name: testTableReal0007
     * @tc.desc: Verify row 6 exposes the four character title and the 全村最帅 singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0007', 0, async (done: Function) => {
      await runCase('testTableReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0007 begin');
        const actual: string = runSongRow(6);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '7|好好学习|全村最帅|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('7|好好学习|全村最帅|ic_SQ'));
        expect(actual).assertEqual('7|好好学习|全村最帅|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('好好学习'));
        expect(actual.split('|')[1]).assertEqual('好好学习');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('全村最帅'));
        expect(actual.split('|')[2]).assertEqual('全村最帅');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0800
     * @tc.name: testTableReal0008
     * @tc.desc: Verify row 7 is the first occurrence of the repeated title 安心安心
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0008', 0, async (done: Function) => {
      await runCase('testTableReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0008 begin');
        const actual: string = runSongRow(7);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '8|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('8|安心安心|小安安|ic_SQ'));
        expect(actual).assertEqual('8|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('安心安心'));
        expect(actual.split('|')[1]).assertEqual('安心安心');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('小安安'));
        expect(actual.split('|')[2]).assertEqual('小安安');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_0900
     * @tc.name: testTableReal0009
     * @tc.desc: Verify row 8 repeats the title of row 19 with the same singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0009', 0, async (done: Function) => {
      await runCase('testTableReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0009 begin');
        const actual: string = runSongRow(8);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '9|HBNJGHJHB|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('9|HBNJGHJHB|我是小树|ic_SQ'));
        expect(actual).assertEqual('9|HBNJGHJHB|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(19, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(19, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('我是小树'));
        expect(actual.split('|')[2]).assertEqual('我是小树');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1000
     * @tc.name: testTableReal0010
     * @tc.desc: Verify row 9 is the second occurrence of 安心安心
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0010', 0, async (done: Function) => {
      await runCase('testTableReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0010 begin');
        const actual: string = runSongRow(9);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '10|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('10|安心安心|小安安|ic_SQ'));
        expect(actual).assertEqual('10|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('10'));
        expect(actual.split('|')[0]).assertEqual('10');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(7, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(7, 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1100
     * @tc.name: testTableReal0011
     * @tc.desc: Verify row 10 is the only row with an ascii title sung by 小安安
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0011', 0, async (done: Function) => {
      await runCase('testTableReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0011 begin');
        const actual: string = runSongRow(10);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '11|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('11|Notebook|小安安|ic_SQ'));
        expect(actual).assertEqual('11|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('Notebook'));
        expect(actual.split('|')[1]).assertEqual('Notebook');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(21, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(21, 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1200
     * @tc.name: testTableReal0012
     * @tc.desc: Verify row 11 is the second and last vip labelled row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0012', 0, async (done: Function) => {
      await runCase('testTableReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0012 begin');
        const actual: string = runSongRow(11);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '12|不知道|小碗你好|ic_vip');
        logAssertion(DOMAIN, TAG, String(actual), String('12|不知道|小碗你好|ic_vip'));
        expect(actual).assertEqual('12|不知道|小碗你好|ic_vip');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('12'));
        expect(actual.split('|')[0]).assertEqual('12');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(0, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(0, 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1300
     * @tc.name: testTableReal0013
     * @tc.desc: Verify row 12 mirrors row 1 in title and singer but differs in id
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0013', 0, async (done: Function) => {
      await runCase('testTableReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0013 begin');
        const actual: string = runSongRow(12);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '13|歌名你好|张三-你好我好都好|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('13|歌名你好|张三-你好我好都好|ic_SQ'));
        expect(actual).assertEqual('13|歌名你好|张三-你好我好都好|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(1, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(1, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String(runSongField(1, 'singer')));
        expect(actual.split('|')[2]).assertEqual(runSongField(1, 'singer'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1400
     * @tc.name: testTableReal0014
     * @tc.desc: Verify row 13 mirrors row 2 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0014', 0, async (done: Function) => {
      await runCase('testTableReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0014 begin');
        const actual: string = runSongRow(13);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '14|还是歌名|不知道你是谁|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('14|还是歌名|不知道你是谁|ic_SQ'));
        expect(actual).assertEqual('14|还是歌名|不知道你是谁|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(2, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(2, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('14'));
        expect(actual.split('|')[0]).assertEqual('14');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1500
     * @tc.name: testTableReal0015
     * @tc.desc: Verify row 14 mirrors row 3 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0015', 0, async (done: Function) => {
      await runCase('testTableReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0015 begin');
        const actual: string = runSongRow(14);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '15|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('15|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ'));
        expect(actual).assertEqual('15|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(3, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(3, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String(runSongField(3, 'singer')));
        expect(actual.split('|')[2]).assertEqual(runSongField(3, 'singer'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1600
     * @tc.name: testTableReal0016
     * @tc.desc: Verify row 15 mirrors row 4 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0016', 0, async (done: Function) => {
      await runCase('testTableReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0016 begin');
        const actual: string = runSongRow(15);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '16|可可不喜欢|名佚|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('16|可可不喜欢|名佚|ic_SQ'));
        expect(actual).assertEqual('16|可可不喜欢|名佚|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(4, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(4, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.endsWith('|ic_SQ')), 'true');
        expect(actual.endsWith('|ic_SQ')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1700
     * @tc.name: testTableReal0017
     * @tc.desc: Verify row 16 mirrors row 5 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0017', 0, async (done: Function) => {
      await runCase('testTableReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0017 begin');
        const actual: string = runSongRow(16);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '17|我是UOUYGBJ|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('17|我是UOUYGBJ|我是小树|ic_SQ'));
        expect(actual).assertEqual('17|我是UOUYGBJ|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(5, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(5, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('17'));
        expect(actual.split('|')[0]).assertEqual('17');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1800
     * @tc.name: testTableReal0018
     * @tc.desc: Verify row 17 mirrors row 6 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0018', 0, async (done: Function) => {
      await runCase('testTableReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0018 begin');
        const actual: string = runSongRow(17);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '18|好好学习|全村最帅|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('18|好好学习|全村最帅|ic_SQ'));
        expect(actual).assertEqual('18|好好学习|全村最帅|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(6, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(6, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String(runSongField(6, 'singer')));
        expect(actual.split('|')[2]).assertEqual(runSongField(6, 'singer'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_1900
     * @tc.name: testTableReal0019
     * @tc.desc: Verify row 18 is the third occurrence of 安心安心
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0019', 0, async (done: Function) => {
      await runCase('testTableReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0019 begin');
        const actual: string = runSongRow(18);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '19|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('19|安心安心|小安安|ic_SQ'));
        expect(actual).assertEqual('19|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(7, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(7, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('小安安'));
        expect(actual.split('|')[2]).assertEqual('小安安');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2000
     * @tc.name: testTableReal0020
     * @tc.desc: Verify row 19 mirrors row 8 in title and singer
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0020', 0, async (done: Function) => {
      await runCase('testTableReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0020 begin');
        const actual: string = runSongRow(19);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '20|HBNJGHJHB|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('20|HBNJGHJHB|我是小树|ic_SQ'));
        expect(actual).assertEqual('20|HBNJGHJHB|我是小树|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(8, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(8, 'title'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String(runSongField(8, 'singer')));
        expect(actual.split('|')[2]).assertEqual(runSongField(8, 'singer'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2100
     * @tc.name: testTableReal0021
     * @tc.desc: Verify row 20 is the fourth occurrence of 安心安心
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0021', 0, async (done: Function) => {
      await runCase('testTableReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0021 begin');
        const actual: string = runSongRow(20);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '21|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('21|安心安心|小安安|ic_SQ'));
        expect(actual).assertEqual('21|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('21'));
        expect(actual.split('|')[0]).assertEqual('21');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('安心安心'));
        expect(actual.split('|')[1]).assertEqual('安心安心');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2200
     * @tc.name: testTableReal0022
     * @tc.desc: Verify row 21 jumps from id 21 to id 23 because id 22 is absent
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0022', 0, async (done: Function) => {
      await runCase('testTableReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0022 begin');
        const actual: string = runSongRow(21);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '23|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('23|Notebook|小安安|ic_SQ'));
        expect(actual).assertEqual('23|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('23'));
        expect(actual.split('|')[0]).assertEqual('23');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0] === '22'), 'false');
        expect(actual.split('|')[0] === '22').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2300
     * @tc.name: testTableReal0023
     * @tc.desc: Verify row 22 is the fifth occurrence of 安心安心
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0023', 0, async (done: Function) => {
      await runCase('testTableReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0023 begin');
        const actual: string = runSongRow(22);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '24|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('24|安心安心|小安安|ic_SQ'));
        expect(actual).assertEqual('24|安心安心|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('24'));
        expect(actual.split('|')[0]).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('安心安心'));
        expect(actual.split('|')[1]).assertEqual('安心安心');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2400
     * @tc.name: testTableReal0024
     * @tc.desc: Verify the last row closes the table with Notebook and id 25
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0024', 0, async (done: Function) => {
      await runCase('testTableReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0024 begin');
        const actual: string = runSongRow(23);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          '25|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual), String('25|Notebook|小安安|ic_SQ'));
        expect(actual).assertEqual('25|Notebook|小安安|ic_SQ');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('25'));
        expect(actual.split('|')[0]).assertEqual('25');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String(runSongField(23, 'title')));
        expect(actual.split('|')[1]).assertEqual(runSongField(23, 'title'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2500
     * @tc.name: testTableReal0025
     * @tc.desc: Verify the row right after the table resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0025', 0, async (done: Function) => {
      await runCase('testTableReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0025 begin');
        const actual: string = runSongRow(SONG_COUNT);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === '25|Notebook|小安安|ic_SQ'), 'false');
        expect(actual === '25|Notebook|小安安|ic_SQ').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.length), String(9));
        expect(actual.length).assertEqual(9);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2600
     * @tc.name: testTableReal0026
     * @tc.desc: Verify a negative row index resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0026', 0, async (done: Function) => {
      await runCase('testTableReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0026 begin');
        const actual: string = runSongRow(-1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === runSongRow(0)), 'false');
        expect(actual === runSongRow(0)).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.startsWith('1|')), 'false');
        expect(actual.startsWith('1|')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2700
     * @tc.name: testTableReal0027
     * @tc.desc: Verify a far out of range row index resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0027', 0, async (done: Function) => {
      await runCase('testTableReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0027 begin');
        const actual: string = runSongRow(100);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual), String(runSongRow(SONG_COUNT)));
        expect(actual).assertEqual(runSongRow(SONG_COUNT));
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(1));
        expect(actual.split('|').length).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2800
     * @tc.name: testTableReal0028
     * @tc.desc: Verify field access on an out of range row is undefined for every field
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0028', 0, async (done: Function) => {
      await runCase('testTableReal0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0028 begin');
        const idField: string = runSongField(SONG_COUNT, 'id');
        const titleField: string = runSongField(SONG_COUNT, 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
          idField, titleField, 'undefined', 'undefined');
        logAssertion(DOMAIN, TAG, String(idField), String('undefined'));
        expect(idField).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(titleField), String('undefined'));
        expect(titleField).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(idField), String(titleField));
        expect(idField).assertEqual(titleField);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_2900
     * @tc.name: testTableReal0029
     * @tc.desc: Verify the id column skips 22 between row 20 and row 21
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0029', 0, async (done: Function) => {
      await runCase('testTableReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0029 begin');
        const before: string = runSongField(20, 'id');
        const after: string = runSongField(21, 'id');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
          before, after, '21', '23');
        logAssertion(DOMAIN, TAG, String(before), String('21'));
        expect(before).assertEqual('21');
        logAssertion(DOMAIN, TAG, String(after), String('23'));
        expect(after).assertEqual('23');
        logAssertion(DOMAIN, TAG, String(Number(after) - Number(before)), String(2));
        expect(Number(after) - Number(before)).assertEqual(2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3000
     * @tc.name: testTableReal0030
     * @tc.desc: Verify the duplicated title 不知道 appears exactly twice
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0030', 0, async (done: Function) => {
      await runCase('testTableReal0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0030 begin');
        const count: string = runSongCount('不知道', 'title');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', count, '2');
        logAssertion(DOMAIN, TAG, String(count), String('2'));
        expect(count).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(runSongField(0, 'title')), String(runSongField(11, 'title')));
        expect(runSongField(0, 'title')).assertEqual(runSongField(11, 'title'));
        logAssertion(DOMAIN, TAG, String(runSongField(1, 'title') === '不知道'), 'false');
        expect(runSongField(1, 'title') === '不知道').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3100
     * @tc.name: testTableReal0031
     * @tc.desc: Verify the singer 小安安 owns eight rows while 我是小树 owns four
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0031', 0, async (done: Function) => {
      await runCase('testTableReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0031 begin');
        const top: string = runSongCount('小安安', 'singer');
        const second: string = runSongCount('我是小树', 'singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
          top, second, '8', '4');
        logAssertion(DOMAIN, TAG, String(top), String('8'));
        expect(top).assertEqual('8');
        logAssertion(DOMAIN, TAG, String(second), String('4'));
        expect(second).assertEqual('4');
        logAssertion(DOMAIN, TAG, String(Number(top) + Number(second)), String(12));
        expect(Number(top) + Number(second)).assertEqual(12);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3200
     * @tc.name: testTableReal0032
     * @tc.desc: Verify the label column holds ic_vip only on the two rows with id 1 and 12
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0032', 0, async (done: Function) => {
      await runCase('testTableReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0032 begin');
        const first: string = runSongField(0, 'label');
        const second: string = runSongField(11, 'label');
        const third: string = runSongField(1, 'label');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s,%{public}s expected=%{public}s',
          first, second, third, 'ic_vip,vip,SQ');
        logAssertion(DOMAIN, TAG, String(first), String('ic_vip'));
        expect(first).assertEqual('ic_vip');
        logAssertion(DOMAIN, TAG, String(second), String('ic_vip'));
        expect(second).assertEqual('ic_vip');
        logAssertion(DOMAIN, TAG, String(third), String('ic_SQ'));
        expect(third).assertEqual('ic_SQ');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3300
     * @tc.name: testTableReal0033
     * @tc.desc: Verify an unknown field name resolves to the unknown marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0033', 0, async (done: Function) => {
      await runCase('testTableReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0033 begin');
        const actual: string = runSongField(0, 'album');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
        logAssertion(DOMAIN, TAG, String(actual), String('unknown'));
        expect(actual).assertEqual('unknown');
        logAssertion(DOMAIN, TAG, String(actual === runSongField(0, 'id')), 'false');
        expect(actual === runSongField(0, 'id')).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual), String(runSongField(23, 'album')));
        expect(actual).assertEqual(runSongField(23, 'album'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3400
     * @tc.name: testTableReal0034
     * @tc.desc: Verify table size, id range and id sum match the frozen table
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTableReal0034', 0, async (done: Function) => {
      await runCase('testTableReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0034 begin');
        const count: string = runSongStats('count');
        const minId: string = runSongStats('min-id');
        const maxId: string = runSongStats('max-id');
        const sum: string = runSongStats('id-sum');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s detected=%{public}s', count, '24');
        logAssertion(DOMAIN, TAG, String(count), String('24'));
        expect(count).assertEqual('24');
        logAssertion(DOMAIN, TAG, String(minId), String('1'));
        expect(minId).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(maxId), String('25'));
        expect(maxId).assertEqual('25');
        logAssertion(DOMAIN, TAG, String(sum), String('303'));
        expect(sum).assertEqual('303');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_SONG_TABLE_01_3500
     * @tc.name: testTableReal0035
     * @tc.desc: Verify the missing id, the distinct counts and the label split agree
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTableReal0035', 0, async (done: Function) => {
      await runCase('testTableReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0035 begin');
        const missing: string = runSongStats('missing-ids');
        const titles: string = runSongStats('distinct-title');
        const singers: string = runSongStats('distinct-singer');
        const vip: string = runSongStats('vip-count');
        const sq: string = runSongStats('sq-count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s detected=%{public}s', missing, '22');
        logAssertion(DOMAIN, TAG, String(missing), String('22'));
        expect(missing).assertEqual('22');
        logAssertion(DOMAIN, TAG, String(titles), String('10'));
        expect(titles).assertEqual('10');
        logAssertion(DOMAIN, TAG, String(singers), String('8'));
        expect(singers).assertEqual('8');
        logAssertion(DOMAIN, TAG, String(Number(vip) + Number(sq)), String(24));
        expect(Number(vip) + Number(sq)).assertEqual(24);
        logAssertion(DOMAIN, TAG, String(sq), String('22'));
        expect(sq).assertEqual('22');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0035 end');
      }, done);
    });

  })
}
