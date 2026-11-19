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
 * Hand written showcase suite for the frozen option table in SongList.ets.
 * The option row is the four button strip under the album cover:
 *   [0] ic_collect / literal '999+'
 *   [1] ic_download / string:download
 *   [2] icon_comments / string:comment
 *   [3] icon_share / string:share
 * Frozen rules under test:
 *   - every index carries a distinct image and a distinct caption;
 *   - only the first caption is a literal, the other three are string
 *     resources, so the probe tags them with the string: prefix;
 *   - the table has exactly four entries, indices outside 0..3 are undefined.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  OPTION_COUNT,
  runOptionField,
  runOptionRow,
  runOptionStats
} from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realOption01Test() {
  describe('RealOption01', () => {

    /**
     * @tc.name   testOptionReal0001
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0001
     * @tc.desc   Anchor: the collect button pairs ic_collect with the literal 999+
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0001 begin');
      const actual: string = runOptionRow(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        'ic_collect|literal:999+');
      expect(actual).assertEqual('ic_collect|literal:999+');
      expect(actual.split('|')[0]).assertEqual('ic_collect');
      expect(actual.endsWith('literal:999+')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0001 end');
    })

    /**
     * @tc.name   testOptionReal0002
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0002
     * @tc.desc   the download button pairs ic_download with the download string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0002 begin');
      const actual: string = runOptionRow(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        'ic_download|string:download');
      expect(actual).assertEqual('ic_download|string:download');
      expect(actual.split('|')[1]).assertEqual('string:download');
      expect(actual.startsWith('ic_download|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0002 end');
    })

    /**
     * @tc.name   testOptionReal0003
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0003
     * @tc.desc   the comment button pairs icon_comments with the comment string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0003 begin');
      const actual: string = runOptionRow(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        'icon_comments|string:comment');
      expect(actual).assertEqual('icon_comments|string:comment');
      expect(actual.split('|')[0]).assertEqual('icon_comments');
      expect(actual.split('|')[1]).assertEqual('string:comment');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0003 end');
    })

    /**
     * @tc.name   testOptionReal0004
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0004
     * @tc.desc   the share button pairs icon_share with the share string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0004 begin');
      const actual: string = runOptionRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
        'icon_share|string:share');
      expect(actual).assertEqual('icon_share|string:share');
      expect(actual.split('|')[0]).assertEqual('icon_share');
      expect(actual.endsWith('string:share')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0004 end');
    })

    /**
     * @tc.name   testOptionReal0005
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0005
     * @tc.desc   Anchor: index 4 is one past the table and resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0005 begin');
      const actual: string = runOptionRow(OPTION_COUNT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === runOptionRow(3)).assertFalse();
      expect(actual.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0005 end');
    })

    /**
     * @tc.name   testOptionReal0006
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0006
     * @tc.desc   a negative option index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0006 begin');
      const actual: string = runOptionRow(-1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual === runOptionRow(0)).assertFalse();
      expect(actual.startsWith('ic_collect')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0006 end');
    })

    /**
     * @tc.name   testOptionReal0007
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0007
     * @tc.desc   a far out of range option index resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0007 begin');
      const actual: string = runOptionRow(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
      expect(actual).assertEqual('undefined');
      expect(actual).assertEqual(runOptionRow(OPTION_COUNT));
      expect(actual.split('|').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0007 end');
    })

    /**
     * @tc.name   testOptionReal0008
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0008
     * @tc.desc   the image field of index 0 is ic_collect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0008 begin');
      const actual: string = runOptionField(0, 'image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_collect');
      expect(actual).assertEqual('ic_collect');
      expect(actual).assertEqual(runOptionRow(0).split('|')[0]);
      expect(actual === 'ic_download').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0008 end');
    })

    /**
     * @tc.name   testOptionReal0009
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0009
     * @tc.desc   the image field of index 1 is ic_download
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0009 begin');
      const actual: string = runOptionField(1, 'image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_download');
      expect(actual).assertEqual('ic_download');
      expect(actual).assertEqual(runOptionRow(1).split('|')[0]);
      expect(actual === runOptionStats('first-image')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0009 end');
    })

    /**
     * @tc.name   testOptionReal0010
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0010
     * @tc.desc   the image field of index 2 is icon_comments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0010 begin');
      const actual: string = runOptionField(2, 'image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_comments');
      expect(actual).assertEqual('icon_comments');
      expect(actual).assertEqual(runOptionRow(2).split('|')[0]);
      expect(actual === 'ic_download').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0010 end');
    })

    /**
     * @tc.name   testOptionReal0011
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0011
     * @tc.desc   the image field of index 3 is icon_share
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0011 begin');
      const actual: string = runOptionField(3, 'image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_share');
      expect(actual).assertEqual('icon_share');
      expect(actual).assertEqual(runOptionRow(3).split('|')[0]);
      expect(actual).assertEqual(runOptionStats('last-image'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0011 end');
    })

    /**
     * @tc.name   testOptionReal0012
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0012
     * @tc.desc   Anchor: the text field of index 0 stays a literal caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0012 begin');
      const actual: string = runOptionField(0, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'literal:999+');
      expect(actual).assertEqual('literal:999+');
      expect(actual.startsWith('literal:')).assertTrue();
      expect(actual.startsWith('string:')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0012 end');
    })

    /**
     * @tc.name   testOptionReal0013
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0013
     * @tc.desc   the text field of index 1 resolves to the download string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0013 begin');
      const actual: string = runOptionField(1, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:download');
      expect(actual).assertEqual('string:download');
      expect(actual.startsWith('string:')).assertTrue();
      expect(actual).assertEqual(runOptionRow(1).split('|')[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0013 end');
    })

    /**
     * @tc.name   testOptionReal0014
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0014
     * @tc.desc   the text field of index 2 resolves to the comment string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0014 begin');
      const actual: string = runOptionField(2, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:comment');
      expect(actual).assertEqual('string:comment');
      expect(actual).assertEqual(runOptionRow(2).split('|')[1]);
      expect(actual === 'string:download').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0014 end');
    })

    /**
     * @tc.name   testOptionReal0015
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0015
     * @tc.desc   the text field of index 3 resolves to the share string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0015 begin');
      const actual: string = runOptionField(3, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:share');
      expect(actual).assertEqual('string:share');
      expect(actual.endsWith(':share')).assertTrue();
      expect(actual).assertEqual(runOptionRow(3).split('|')[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0015 end');
    })

    /**
     * @tc.name   testOptionReal0016
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0016
     * @tc.desc   an unknown field name resolves to the unknown marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0016 begin');
      const actual: string = runOptionField(0, 'badge');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
      expect(actual).assertEqual('unknown');
      expect(actual === runOptionField(0, 'image')).assertFalse();
      expect(actual).assertEqual(runOptionField(3, 'badge'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0016 end');
    })

    /**
     * @tc.name   testOptionReal0017
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0017
     * @tc.desc   field access on index 4 is undefined regardless of the field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0017 begin');
      const image: string = runOptionField(OPTION_COUNT, 'image');
      const text: string = runOptionField(OPTION_COUNT, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
        image, text, 'undefined', 'undefined');
      expect(image).assertEqual('undefined');
      expect(text).assertEqual('undefined');
      expect(image).assertEqual(text);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0017 end');
    })

    /**
     * @tc.name   testOptionReal0018
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0018
     * @tc.desc   the option table holds exactly four entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0018 begin');
      const actual: string = runOptionStats('count');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
      expect(actual).assertEqual('4');
      expect(actual).assertEqual(OPTION_COUNT.toString());
      expect(Number(actual)).assertLarger(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0018 end');
    })

    /**
     * @tc.name   testOptionReal0019
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0019
     * @tc.desc   the first option image is ic_collect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0019 begin');
      const actual: string = runOptionStats('first-image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_collect');
      expect(actual).assertEqual('ic_collect');
      expect(actual).assertEqual(runOptionField(0, 'image'));
      expect(actual === runOptionStats('last-image')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0019 end');
    })

    /**
     * @tc.name   testOptionReal0020
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0020
     * @tc.desc   the last option image is icon_share
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0020 begin');
      const actual: string = runOptionStats('last-image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_share');
      expect(actual).assertEqual('icon_share');
      expect(actual).assertEqual(runOptionField(OPTION_COUNT - 1, 'image'));
      expect(actual.endsWith('share')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0020 end');
    })

    /**
     * @tc.name   testOptionReal0021
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0021
     * @tc.desc   the four option images are pairwise distinct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0021 begin');
      const actual: string = runOptionStats('distinct-image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
      expect(actual).assertEqual('4');
      expect(actual).assertEqual(runOptionStats('count'));
      expect(actual === '3').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0021 end');
    })

    /**
     * @tc.name   testOptionReal0022
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0022
     * @tc.desc   option 0 and option 1 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0022 begin');
      const row0: string = runOptionRow(0);
      const row1: string = runOptionRow(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row1, 'different');
      expect(row0 === row1).assertFalse();
      expect(row0.split('|')[0] === row1.split('|')[0]).assertFalse();
      expect(row0.split('|')[1] === row1.split('|')[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0022 end');
    })

    /**
     * @tc.name   testOptionReal0023
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0023
     * @tc.desc   option 1 and option 2 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0023 begin');
      const row1: string = runOptionRow(1);
      const row2: string = runOptionRow(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row1, row2, 'different');
      expect(row1 === row2).assertFalse();
      expect(row1.split('|')[0] === row2.split('|')[0]).assertFalse();
      expect(row1.split('|')[1] === row2.split('|')[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0023 end');
    })

    /**
     * @tc.name   testOptionReal0024
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0024
     * @tc.desc   option 2 and option 3 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0024 begin');
      const row2: string = runOptionRow(2);
      const row3: string = runOptionRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row2, row3, 'different');
      expect(row2 === row3).assertFalse();
      expect(row2.split('|')[0] === row3.split('|')[0]).assertFalse();
      expect(row2.split('|')[1] === row3.split('|')[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0024 end');
    })

    /**
     * @tc.name   testOptionReal0025
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0025
     * @tc.desc   option 0 and option 3 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0025 begin');
      const row0: string = runOptionRow(0);
      const row3: string = runOptionRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row3, 'different');
      expect(row0 === row3).assertFalse();
      expect(row0.split('|')[0]).assertEqual('ic_collect');
      expect(row3.split('|')[0]).assertEqual('icon_share');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0025 end');
    })

    /**
     * @tc.name   testOptionReal0026
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0026
     * @tc.desc   option 0 and option 2 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0026 begin');
      const row0: string = runOptionRow(0);
      const row2: string = runOptionRow(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row2, 'different');
      expect(row0 === row2).assertFalse();
      expect(row0.split('|')[0] === row2.split('|')[0]).assertFalse();
      expect(row2.startsWith('icon_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0026 end');
    })

    /**
     * @tc.name   testOptionReal0027
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0027
     * @tc.desc   option 1 and option 3 differ in both image and caption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0027 begin');
      const row1: string = runOptionRow(1);
      const row3: string = runOptionRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row1, row3, 'different');
      expect(row1 === row3).assertFalse();
      expect(row1.split('|')[1]).assertEqual('string:download');
      expect(row3.split('|')[1]).assertEqual('string:share');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0027 end');
    })

    /**
     * @tc.name   testOptionReal0028
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0028
     * @tc.desc   exactly one caption is a literal and three are string resources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0028 begin');
      const texts: string[] = [
        runOptionField(0, 'text'),
        runOptionField(1, 'text'),
        runOptionField(2, 'text'),
        runOptionField(3, 'text')
      ];
      let literalCount: number = 0;
      let stringCount: number = 0;
      for (let i = 0; i < texts.length; i++) {
        if (texts[i].startsWith('literal:')) {
          literalCount++;
        }
        if (texts[i].startsWith('string:')) {
          stringCount++;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
        literalCount, stringCount, 1, 3);
      expect(literalCount).assertEqual(1);
      expect(stringCount).assertEqual(3);
      expect(literalCount + stringCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0028 end');
    })

    /**
     * @tc.name   testOptionReal0029
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0029
     * @tc.desc   no caption falls back to the other marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0029 begin');
      const first: string = runOptionField(0, 'text');
      const second: string = runOptionField(1, 'text');
      const third: string = runOptionField(2, 'text');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s|%{public}s|%{public}s expected=%{public}s',
        first, second, third, 'no other marker');
      expect(first === 'string:other').assertFalse();
      expect(second === 'string:other').assertFalse();
      expect(third === 'string:other').assertFalse();
      expect(runOptionField(3, 'text') === 'string:other').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0029 end');
    })

    /**
     * @tc.name   testOptionReal0030
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0030
     * @tc.desc   no option image falls back to the other marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0030 begin');
      const images: string[] = [
        runOptionField(0, 'image'),
        runOptionField(1, 'image'),
        runOptionField(2, 'image'),
        runOptionField(3, 'image')
      ];
      let otherCount: number = 0;
      for (let i = 0; i < images.length; i++) {
        if (images[i] === 'other') {
          otherCount++;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', otherCount, 0);
      expect(otherCount).assertEqual(0);
      expect(images.indexOf('ic_collect')).assertEqual(0);
      expect(images.indexOf('icon_share')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0030 end');
    })

    /**
     * @tc.name   testOptionReal0031
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0031
     * @tc.desc   the composed row equals image field plus text field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0031 begin');
      const composed: string = runOptionField(0, 'image') + '|' + runOptionField(0, 'text');
      const row: string = runOptionRow(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', composed, row);
      expect(composed).assertEqual(row);
      expect(composed.split('|').length).assertEqual(2);
      expect(row.startsWith('ic_collect|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0031 end');
    })

    /**
     * @tc.name   testOptionReal0032
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0032
     * @tc.desc   the last composed row equals image field plus text field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0032 begin');
      const composed: string = runOptionField(3, 'image') + '|' + runOptionField(3, 'text');
      const row: string = runOptionRow(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', composed, row);
      expect(composed).assertEqual(row);
      expect(composed).assertEqual('icon_share|string:share');
      expect(row).assertEqual(runOptionRow(OPTION_COUNT - 1));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0032 end');
    })

    /**
     * @tc.name   testOptionReal0033
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0033
     * @tc.desc   the stats helpers agree with the per row helpers on both edges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0033 begin');
      const firstStats: string = runOptionStats('first-image');
      const firstRow: string = runOptionRow(0).split('|')[0];
      const lastStats: string = runOptionStats('last-image');
      const lastRow: string = runOptionRow(OPTION_COUNT - 1).split('|')[0];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', firstStats, lastStats,
        'ic_collect#icon_share');
      expect(firstStats).assertEqual(firstRow);
      expect(lastStats).assertEqual(lastRow);
      expect(firstStats === lastStats).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0033 end');
    })

    /**
     * @tc.name   testOptionReal0034
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0034
     * @tc.desc   an unknown stats kind resolves to the unknown marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testOptionReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0034 begin');
      const actual: string = runOptionStats('median-image');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
      expect(actual).assertEqual('unknown');
      expect(actual === runOptionStats('count')).assertFalse();
      expect(actual).assertEqual(runOptionStats('badge'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0034 end');
    })

    /**
     * @tc.name   testOptionReal0035
     * @tc.number SUB_MUSICALBUM_OPT_REAL_0035
     * @tc.desc   Anchor: the whole strip composes into the frozen four row snapshot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOptionReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0035 begin');
      const joined: string = runOptionRow(0) + ';' + runOptionRow(1) + ';' + runOptionRow(2) + ';' +
        runOptionRow(3);
      const expected: string = 'ic_collect|literal:999+;ic_download|string:download;' +
        'icon_comments|string:comment;icon_share|string:share';
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', joined, expected);
      expect(joined).assertEqual(expected);
      expect(joined.split(';').length).assertEqual(4);
      expect(joined.startsWith('ic_collect|literal:999+;')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0035 end');
    })

  })
}
