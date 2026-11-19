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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

export default function realSongTable01Test() {
  describe('RealSongTable01', () => {

    /**
     * @tc.name   testTableReal0001
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0001
     * @tc.desc   Anchor: row 0 exposes id 1, its title, singer and the vip label
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0001 begin');
      const actual: string = runSongRow(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|不知道|小碗你好|ic_vip');
      expect(actual).assertEqual('1|不知道|小碗你好|ic_vip');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.endsWith('|ic_vip')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0001 end');
    })

    /**
     * @tc.name   testTableReal0002
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0002
     * @tc.desc   row 1 exposes the long singer name and the SQ label
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0002 begin');
      const actual: string = runSongRow(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '2|歌名你好|张三-你好我好都好|ic_SQ');
      expect(actual).assertEqual('2|歌名你好|张三-你好我好都好|ic_SQ');
      expect(actual.split('|')[1]).assertEqual('歌名你好');
      expect(actual.split('|')[3]).assertEqual('ic_SQ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0002 end');
    })

    /**
     * @tc.name   testTableReal0003
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0003
     * @tc.desc   row 2 exposes a sentence shaped singer name
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0003 begin');
      const actual: string = runSongRow(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '3|还是歌名|不知道你是谁|ic_SQ');
      expect(actual).assertEqual('3|还是歌名|不知道你是谁|ic_SQ');
      expect(actual.split('|')[2]).assertEqual('不知道你是谁');
      expect(actual.split('|').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0003 end');
    })

    /**
     * @tc.name   testTableReal0004
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0004
     * @tc.desc   row 3 keeps the upper case ascii title and the hyphenated singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0004 begin');
      const actual: string = runSongRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '4|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
      expect(actual).assertEqual('4|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
      expect(actual.split('|')[1]).assertEqual('AIUHGVNHK');
      expect(actual.startsWith('4|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0004 end');
    })

    /**
     * @tc.name   testTableReal0005
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0005
     * @tc.desc   row 4 exposes the three character title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0005 begin');
      const actual: string = runSongRow(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '5|可可不喜欢|名佚|ic_SQ');
      expect(actual).assertEqual('5|可可不喜欢|名佚|ic_SQ');
      expect(actual.split('|')[2]).assertEqual('名佚');
      expect(actual.split('|')[3]).assertEqual('ic_SQ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0005 end');
    })

    /**
     * @tc.name   testTableReal0006
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0006
     * @tc.desc   row 5 exposes the mixed case title and the 我是小树 singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0006 begin');
      const actual: string = runSongRow(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '6|我是UOUYGBJ|我是小树|ic_SQ');
      expect(actual).assertEqual('6|我是UOUYGBJ|我是小树|ic_SQ');
      expect(actual.split('|')[2]).assertEqual('我是小树');
      expect(actual.split('|')[0]).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0006 end');
    })

    /**
     * @tc.name   testTableReal0007
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0007
     * @tc.desc   row 6 exposes the four character title and the 全村最帅 singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0007 begin');
      const actual: string = runSongRow(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '7|好好学习|全村最帅|ic_SQ');
      expect(actual).assertEqual('7|好好学习|全村最帅|ic_SQ');
      expect(actual.split('|')[1]).assertEqual('好好学习');
      expect(actual.split('|')[2]).assertEqual('全村最帅');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0007 end');
    })

    /**
     * @tc.name   testTableReal0008
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0008
     * @tc.desc   row 7 is the first occurrence of the repeated title 安心安心
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0008 begin');
      const actual: string = runSongRow(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '8|安心安心|小安安|ic_SQ');
      expect(actual).assertEqual('8|安心安心|小安安|ic_SQ');
      expect(actual.split('|')[1]).assertEqual('安心安心');
      expect(actual.split('|')[2]).assertEqual('小安安');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0008 end');
    })

    /**
     * @tc.name   testTableReal0009
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0009
     * @tc.desc   row 8 repeats the title of row 19 with the same singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0009 begin');
      const actual: string = runSongRow(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '9|HBNJGHJHB|我是小树|ic_SQ');
      expect(actual).assertEqual('9|HBNJGHJHB|我是小树|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(19, 'title'));
      expect(actual.split('|')[2]).assertEqual('我是小树');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0009 end');
    })

    /**
     * @tc.name   testTableReal0010
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0010
     * @tc.desc   row 9 is the second occurrence of 安心安心
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0010 begin');
      const actual: string = runSongRow(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '10|安心安心|小安安|ic_SQ');
      expect(actual).assertEqual('10|安心安心|小安安|ic_SQ');
      expect(actual.split('|')[0]).assertEqual('10');
      expect(actual.split('|')[1]).assertEqual(runSongField(7, 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0010 end');
    })

    /**
     * @tc.name   testTableReal0011
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0011
     * @tc.desc   row 10 is the only row with an ascii title sung by 小安安
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0011 begin');
      const actual: string = runSongRow(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '11|Notebook|小安安|ic_SQ');
      expect(actual).assertEqual('11|Notebook|小安安|ic_SQ');
      expect(actual.split('|')[1]).assertEqual('Notebook');
      expect(actual.split('|')[1]).assertEqual(runSongField(21, 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0011 end');
    })

    /**
     * @tc.name   testTableReal0012
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0012
     * @tc.desc   Anchor: row 11 is the second and last vip labelled row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0012 begin');
      const actual: string = runSongRow(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '12|不知道|小碗你好|ic_vip');
      expect(actual).assertEqual('12|不知道|小碗你好|ic_vip');
      expect(actual.split('|')[0]).assertEqual('12');
      expect(actual.split('|')[1]).assertEqual(runSongField(0, 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0012 end');
    })

    /**
     * @tc.name   testTableReal0013
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0013
     * @tc.desc   row 12 mirrors row 1 in title and singer but differs in id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0013 begin');
      const actual: string = runSongRow(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '13|歌名你好|张三-你好我好都好|ic_SQ');
      expect(actual).assertEqual('13|歌名你好|张三-你好我好都好|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(1, 'title'));
      expect(actual.split('|')[2]).assertEqual(runSongField(1, 'singer'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0013 end');
    })

    /**
     * @tc.name   testTableReal0014
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0014
     * @tc.desc   row 13 mirrors row 2 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0014 begin');
      const actual: string = runSongRow(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '14|还是歌名|不知道你是谁|ic_SQ');
      expect(actual).assertEqual('14|还是歌名|不知道你是谁|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(2, 'title'));
      expect(actual.split('|')[0]).assertEqual('14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0014 end');
    })

    /**
     * @tc.name   testTableReal0015
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0015
     * @tc.desc   row 14 mirrors row 3 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0015 begin');
      const actual: string = runSongRow(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '15|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
      expect(actual).assertEqual('15|AIUHGVNHK|Gwyu-Hjjiyabn|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(3, 'title'));
      expect(actual.split('|')[2]).assertEqual(runSongField(3, 'singer'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0015 end');
    })

    /**
     * @tc.name   testTableReal0016
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0016
     * @tc.desc   row 15 mirrors row 4 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0016 begin');
      const actual: string = runSongRow(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '16|可可不喜欢|名佚|ic_SQ');
      expect(actual).assertEqual('16|可可不喜欢|名佚|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(4, 'title'));
      expect(actual.endsWith('|ic_SQ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0016 end');
    })

    /**
     * @tc.name   testTableReal0017
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0017
     * @tc.desc   row 16 mirrors row 5 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0017 begin');
      const actual: string = runSongRow(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '17|我是UOUYGBJ|我是小树|ic_SQ');
      expect(actual).assertEqual('17|我是UOUYGBJ|我是小树|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(5, 'title'));
      expect(actual.split('|')[0]).assertEqual('17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0017 end');
    })

    /**
     * @tc.name   testTableReal0018
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0018
     * @tc.desc   row 17 mirrors row 6 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0018 begin');
      const actual: string = runSongRow(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '18|好好学习|全村最帅|ic_SQ');
      expect(actual).assertEqual('18|好好学习|全村最帅|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(6, 'title'));
      expect(actual.split('|')[2]).assertEqual(runSongField(6, 'singer'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0018 end');
    })

    /**
     * @tc.name   testTableReal0019
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0019
     * @tc.desc   row 18 is the third occurrence of 安心安心
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0019 begin');
      const actual: string = runSongRow(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '19|安心安心|小安安|ic_SQ');
      expect(actual).assertEqual('19|安心安心|小安安|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(7, 'title'));
      expect(actual.split('|')[2]).assertEqual('小安安');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0019 end');
    })

    /**
     * @tc.name   testTableReal0020
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0020
     * @tc.desc   row 19 mirrors row 8 in title and singer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0020 begin');
      const actual: string = runSongRow(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '20|HBNJGHJHB|我是小树|ic_SQ');
      expect(actual).assertEqual('20|HBNJGHJHB|我是小树|ic_SQ');
      expect(actual.split('|')[1]).assertEqual(runSongField(8, 'title'));
      expect(actual.split('|')[2]).assertEqual(runSongField(8, 'singer'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0020 end');
    })

    /**
     * @tc.name   testTableReal0021
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0021
     * @tc.desc   row 20 is the fourth occurrence of 安心安心
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0021 begin');
      const actual: string = runSongRow(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '21|安心安心|小安安|ic_SQ');
      expect(actual).assertEqual('21|安心安心|小安安|ic_SQ');
      expect(actual.split('|')[0]).assertEqual('21');
      expect(actual.split('|')[1]).assertEqual('安心安心');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0021 end');
    })

    /**
     * @tc.name   testTableReal0022
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0022
     * @tc.desc   Anchor: row 21 jumps from id 21 to id 23 because id 22 is absent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0022 begin');
      const actual: string = runSongRow(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '23|Notebook|小安安|ic_SQ');
      expect(actual).assertEqual('23|Notebook|小安安|ic_SQ');
      expect(actual.split('|')[0]).assertEqual('23');
      expect(actual.split('|')[0] === '22').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0022 end');
    })

    /**
     * @tc.name   testTableReal0023
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0023
     * @tc.desc   row 22 is the fifth occurrence of 安心安心
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0023 begin');
      const actual: string = runSongRow(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '24|安心安心|小安安|ic_SQ');
      expect(actual).assertEqual('24|安心安心|小安安|ic_SQ');
      expect(actual.split('|')[0]).assertEqual('24');
      expect(actual.split('|')[1]).assertEqual('安心安心');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0023 end');
    })

    /**
     * @tc.name   testTableReal0024
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0024
     * @tc.desc   the last row closes the table with Notebook and id 25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0024 begin');
      const actual: string = runSongRow(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        '25|Notebook|小安安|ic_SQ');
      expect(actual).assertEqual('25|Notebook|小安安|ic_SQ');
      expect(actual.split('|')[0]).assertEqual('25');
      expect(actual.split('|')[1]).assertEqual(runSongField(23, 'title'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0024 end');
    })

    /**
     * @tc.name   testTableReal0025
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0025
     * @tc.desc   Anchor: the row right after the table resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0025 begin');
      const actual: string = runSongRow(SONG_COUNT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === '25|Notebook|小安安|ic_SQ').assertFalse();
      expect(actual.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0025 end');
    })

    /**
     * @tc.name   testTableReal0026
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0026
     * @tc.desc   a negative row index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0026 begin');
      const actual: string = runSongRow(-1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === runSongRow(0)).assertFalse();
      expect(actual.startsWith('1|')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0026 end');
    })

    /**
     * @tc.name   testTableReal0027
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0027
     * @tc.desc   a far out of range row index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0027 begin');
      const actual: string = runSongRow(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual).assertEqual(runSongRow(SONG_COUNT));
      expect(actual.split('|').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0027 end');
    })

    /**
     * @tc.name   testTableReal0028
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0028
     * @tc.desc   field access on an out of range row is undefined for every field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0028 begin');
      const idField: string = runSongField(SONG_COUNT, 'id');
      const titleField: string = runSongField(SONG_COUNT, 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
        idField, titleField, 'undefined', 'undefined');
      expect(idField).assertEqual('undefined');
      expect(titleField).assertEqual('undefined');
      expect(idField).assertEqual(titleField);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0028 end');
    })

    /**
     * @tc.name   testTableReal0029
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0029
     * @tc.desc   Anchor: the id column skips 22 between row 20 and row 21
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0029 begin');
      const before: string = runSongField(20, 'id');
      const after: string = runSongField(21, 'id');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
        before, after, '21', '23');
      expect(before).assertEqual('21');
      expect(after).assertEqual('23');
      expect(Number(after) - Number(before)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0029 end');
    })

    /**
     * @tc.name   testTableReal0030
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0030
     * @tc.desc   the duplicated title 不知道 appears exactly twice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0030 begin');
      const count: string = runSongCount('不知道', 'title');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', count, '2');
      expect(count).assertEqual('2');
      expect(runSongField(0, 'title')).assertEqual(runSongField(11, 'title'));
      expect(runSongField(1, 'title') === '不知道').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0030 end');
    })

    /**
     * @tc.name   testTableReal0031
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0031
     * @tc.desc   the singer 小安安 owns eight rows while 我是小树 owns four
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0031 begin');
      const top: string = runSongCount('小安安', 'singer');
      const second: string = runSongCount('我是小树', 'singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
        top, second, '8', '4');
      expect(top).assertEqual('8');
      expect(second).assertEqual('4');
      expect(Number(top) + Number(second)).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0031 end');
    })

    /**
     * @tc.name   testTableReal0032
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0032
     * @tc.desc   the label column holds ic_vip only on the two rows with id 1 and 12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0032 begin');
      const first: string = runSongField(0, 'label');
      const second: string = runSongField(11, 'label');
      const third: string = runSongField(1, 'label');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s,%{public}s expected=%{public}s',
        first, second, third, 'ic_vip,vip,SQ');
      expect(first).assertEqual('ic_vip');
      expect(second).assertEqual('ic_vip');
      expect(third).assertEqual('ic_SQ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0032 end');
    })

    /**
     * @tc.name   testTableReal0033
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0033
     * @tc.desc   an unknown field name resolves to the unknown marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0033 begin');
      const actual: string = runSongField(0, 'album');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
      expect(actual).assertEqual('unknown');
      expect(actual === runSongField(0, 'id')).assertFalse();
      expect(actual).assertEqual(runSongField(23, 'album'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0033 end');
    })

    /**
     * @tc.name   testTableReal0034
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0034
     * @tc.desc   table size, id range and id sum match the frozen table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTableReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0034 begin');
      const count: string = runSongStats('count');
      const minId: string = runSongStats('min-id');
      const maxId: string = runSongStats('max-id');
      const sum: string = runSongStats('id-sum');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s detected=%{public}s', count, '24');
      expect(count).assertEqual('24');
      expect(minId).assertEqual('1');
      expect(maxId).assertEqual('25');
      expect(sum).assertEqual('303');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0034 end');
    })

    /**
     * @tc.name   testTableReal0035
     * @tc.number SUB_MUSICALBUM_TABLE_REAL_0035
     * @tc.desc   Anchor: the missing id, the distinct counts and the label split agree
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTableReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0035 begin');
      const missing: string = runSongStats('missing-ids');
      const titles: string = runSongStats('distinct-title');
      const singers: string = runSongStats('distinct-singer');
      const vip: string = runSongStats('vip-count');
      const sq: string = runSongStats('sq-count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s detected=%{public}s', missing, '22');
      expect(missing).assertEqual('22');
      expect(titles).assertEqual('10');
      expect(singers).assertEqual('8');
      expect(Number(vip) + Number(sq)).assertEqual(24);
      expect(sq).assertEqual('22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTableReal0035 end');
    })

  })
}
