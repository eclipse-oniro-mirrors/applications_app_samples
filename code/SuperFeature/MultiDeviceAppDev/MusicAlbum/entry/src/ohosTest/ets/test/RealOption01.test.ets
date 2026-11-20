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
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  OPTION_COUNT,
  runOptionField,
  runOptionRow,
  runOptionStats
} from '../util/SongTableProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realOption01Test(): void {
  describe('RealOption01Test', () => {

    /*
     * @tc.number: SUB_REAL_OPTION_01_0100
     * @tc.name: testOptionReal0001
     * @tc.desc: Verify the collect button pairs ic_collect with the literal 999+
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0001', 0, async (done: Function) => {
      await runCase('testOptionReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0001 begin');
        const actual: string = runOptionRow(0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          'ic_collect|literal:999+');
        logAssertion(DOMAIN, TAG, String(actual), String('ic_collect|literal:999+'));
        expect(actual).assertEqual('ic_collect|literal:999+');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('ic_collect'));
        expect(actual.split('|')[0]).assertEqual('ic_collect');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('literal:999+')), 'true');
        expect(actual.endsWith('literal:999+')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0200
     * @tc.name: testOptionReal0002
     * @tc.desc: Verify the download button pairs ic_download with the download string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0002', 0, async (done: Function) => {
      await runCase('testOptionReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0002 begin');
        const actual: string = runOptionRow(1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          'ic_download|string:download');
        logAssertion(DOMAIN, TAG, String(actual), String('ic_download|string:download'));
        expect(actual).assertEqual('ic_download|string:download');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('string:download'));
        expect(actual.split('|')[1]).assertEqual('string:download');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('ic_download|')), 'true');
        expect(actual.startsWith('ic_download|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0300
     * @tc.name: testOptionReal0003
     * @tc.desc: Verify the comment button pairs icon_comments with the comment string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0003', 0, async (done: Function) => {
      await runCase('testOptionReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0003 begin');
        const actual: string = runOptionRow(2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          'icon_comments|string:comment');
        logAssertion(DOMAIN, TAG, String(actual), String('icon_comments|string:comment'));
        expect(actual).assertEqual('icon_comments|string:comment');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('icon_comments'));
        expect(actual.split('|')[0]).assertEqual('icon_comments');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('string:comment'));
        expect(actual.split('|')[1]).assertEqual('string:comment');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0400
     * @tc.name: testOptionReal0004
     * @tc.desc: Verify the share button pairs icon_share with the share string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0004', 0, async (done: Function) => {
      await runCase('testOptionReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0004 begin');
        const actual: string = runOptionRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual,
          'icon_share|string:share');
        logAssertion(DOMAIN, TAG, String(actual), String('icon_share|string:share'));
        expect(actual).assertEqual('icon_share|string:share');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('icon_share'));
        expect(actual.split('|')[0]).assertEqual('icon_share');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('string:share')), 'true');
        expect(actual.endsWith('string:share')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0500
     * @tc.name: testOptionReal0005
     * @tc.desc: Verify index 4 is one past the table and resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0005', 0, async (done: Function) => {
      await runCase('testOptionReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0005 begin');
        const actual: string = runOptionRow(OPTION_COUNT);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === runOptionRow(3)), 'false');
        expect(actual === runOptionRow(3)).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.length), String(9));
        expect(actual.length).assertEqual(9);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0600
     * @tc.name: testOptionReal0006
     * @tc.desc: Verify a negative option index resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0006', 0, async (done: Function) => {
      await runCase('testOptionReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0006 begin');
        const actual: string = runOptionRow(-1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual === runOptionRow(0)), 'false');
        expect(actual === runOptionRow(0)).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.startsWith('ic_collect')), 'false');
        expect(actual.startsWith('ic_collect')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0700
     * @tc.name: testOptionReal0007
     * @tc.desc: Verify a far out of range option index resolves to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0007', 0, async (done: Function) => {
      await runCase('testOptionReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0007 begin');
        const actual: string = runOptionRow(100);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'undefined');
        logAssertion(DOMAIN, TAG, String(actual), String('undefined'));
        expect(actual).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(OPTION_COUNT)));
        expect(actual).assertEqual(runOptionRow(OPTION_COUNT));
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(1));
        expect(actual.split('|').length).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0800
     * @tc.name: testOptionReal0008
     * @tc.desc: Verify the image field of index 0 is ic_collect
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0008', 0, async (done: Function) => {
      await runCase('testOptionReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0008 begin');
        const actual: string = runOptionField(0, 'image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_collect');
        logAssertion(DOMAIN, TAG, String(actual), String('ic_collect'));
        expect(actual).assertEqual('ic_collect');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(0).split('|')[0]));
        expect(actual).assertEqual(runOptionRow(0).split('|')[0]);
        logAssertion(DOMAIN, TAG, String(actual === 'ic_download'), 'false');
        expect(actual === 'ic_download').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_0900
     * @tc.name: testOptionReal0009
     * @tc.desc: Verify the image field of index 1 is ic_download
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0009', 0, async (done: Function) => {
      await runCase('testOptionReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0009 begin');
        const actual: string = runOptionField(1, 'image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_download');
        logAssertion(DOMAIN, TAG, String(actual), String('ic_download'));
        expect(actual).assertEqual('ic_download');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(1).split('|')[0]));
        expect(actual).assertEqual(runOptionRow(1).split('|')[0]);
        logAssertion(DOMAIN, TAG, String(actual === runOptionStats('first-image')), 'false');
        expect(actual === runOptionStats('first-image')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1000
     * @tc.name: testOptionReal0010
     * @tc.desc: Verify the image field of index 2 is icon_comments
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0010', 0, async (done: Function) => {
      await runCase('testOptionReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0010 begin');
        const actual: string = runOptionField(2, 'image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_comments');
        logAssertion(DOMAIN, TAG, String(actual), String('icon_comments'));
        expect(actual).assertEqual('icon_comments');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(2).split('|')[0]));
        expect(actual).assertEqual(runOptionRow(2).split('|')[0]);
        logAssertion(DOMAIN, TAG, String(actual === 'ic_download'), 'false');
        expect(actual === 'ic_download').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1100
     * @tc.name: testOptionReal0011
     * @tc.desc: Verify the image field of index 3 is icon_share
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0011', 0, async (done: Function) => {
      await runCase('testOptionReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0011 begin');
        const actual: string = runOptionField(3, 'image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_share');
        logAssertion(DOMAIN, TAG, String(actual), String('icon_share'));
        expect(actual).assertEqual('icon_share');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(3).split('|')[0]));
        expect(actual).assertEqual(runOptionRow(3).split('|')[0]);
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionStats('last-image')));
        expect(actual).assertEqual(runOptionStats('last-image'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1200
     * @tc.name: testOptionReal0012
     * @tc.desc: Verify the text field of index 0 stays a literal caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0012', 0, async (done: Function) => {
      await runCase('testOptionReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0012 begin');
        const actual: string = runOptionField(0, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'literal:999+');
        logAssertion(DOMAIN, TAG, String(actual), String('literal:999+'));
        expect(actual).assertEqual('literal:999+');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('literal:')), 'true');
        expect(actual.startsWith('literal:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual.startsWith('string:')), 'false');
        expect(actual.startsWith('string:')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1300
     * @tc.name: testOptionReal0013
     * @tc.desc: Verify the text field of index 1 resolves to the download string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0013', 0, async (done: Function) => {
      await runCase('testOptionReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0013 begin');
        const actual: string = runOptionField(1, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:download');
        logAssertion(DOMAIN, TAG, String(actual), String('string:download'));
        expect(actual).assertEqual('string:download');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('string:')), 'true');
        expect(actual.startsWith('string:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(1).split('|')[1]));
        expect(actual).assertEqual(runOptionRow(1).split('|')[1]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1400
     * @tc.name: testOptionReal0014
     * @tc.desc: Verify the text field of index 2 resolves to the comment string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0014', 0, async (done: Function) => {
      await runCase('testOptionReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0014 begin');
        const actual: string = runOptionField(2, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:comment');
        logAssertion(DOMAIN, TAG, String(actual), String('string:comment'));
        expect(actual).assertEqual('string:comment');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(2).split('|')[1]));
        expect(actual).assertEqual(runOptionRow(2).split('|')[1]);
        logAssertion(DOMAIN, TAG, String(actual === 'string:download'), 'false');
        expect(actual === 'string:download').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1500
     * @tc.name: testOptionReal0015
     * @tc.desc: Verify the text field of index 3 resolves to the share string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0015', 0, async (done: Function) => {
      await runCase('testOptionReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0015 begin');
        const actual: string = runOptionField(3, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'string:share');
        logAssertion(DOMAIN, TAG, String(actual), String('string:share'));
        expect(actual).assertEqual('string:share');
        logAssertion(DOMAIN, TAG, String(actual.endsWith(':share')), 'true');
        expect(actual.endsWith(':share')).assertTrue();
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionRow(3).split('|')[1]));
        expect(actual).assertEqual(runOptionRow(3).split('|')[1]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1600
     * @tc.name: testOptionReal0016
     * @tc.desc: Verify an unknown field name resolves to the unknown marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0016', 0, async (done: Function) => {
      await runCase('testOptionReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0016 begin');
        const actual: string = runOptionField(0, 'badge');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
        logAssertion(DOMAIN, TAG, String(actual), String('unknown'));
        expect(actual).assertEqual('unknown');
        logAssertion(DOMAIN, TAG, String(actual === runOptionField(0, 'image')), 'false');
        expect(actual === runOptionField(0, 'image')).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionField(3, 'badge')));
        expect(actual).assertEqual(runOptionField(3, 'badge'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1700
     * @tc.name: testOptionReal0017
     * @tc.desc: Verify field access on index 4 is undefined regardless of the field
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0017', 0, async (done: Function) => {
      await runCase('testOptionReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0017 begin');
        const image: string = runOptionField(OPTION_COUNT, 'image');
        const text: string = runOptionField(OPTION_COUNT, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
          image, text, 'undefined', 'undefined');
        logAssertion(DOMAIN, TAG, String(image), String('undefined'));
        expect(image).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(text), String('undefined'));
        expect(text).assertEqual('undefined');
        logAssertion(DOMAIN, TAG, String(image), String(text));
        expect(image).assertEqual(text);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1800
     * @tc.name: testOptionReal0018
     * @tc.desc: Verify the option table holds exactly four entries
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0018', 0, async (done: Function) => {
      await runCase('testOptionReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0018 begin');
        const actual: string = runOptionStats('count');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
        logAssertion(DOMAIN, TAG, String(actual), String('4'));
        expect(actual).assertEqual('4');
        logAssertion(DOMAIN, TAG, String(actual), String(OPTION_COUNT.toString()));
        expect(actual).assertEqual(OPTION_COUNT.toString());
        logAssertion(DOMAIN, TAG, String(Number(actual)), '> ' + String(3));
        expect(Number(actual)).assertLarger(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_1900
     * @tc.name: testOptionReal0019
     * @tc.desc: Verify the first option image is ic_collect
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0019', 0, async (done: Function) => {
      await runCase('testOptionReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0019 begin');
        const actual: string = runOptionStats('first-image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'ic_collect');
        logAssertion(DOMAIN, TAG, String(actual), String('ic_collect'));
        expect(actual).assertEqual('ic_collect');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionField(0, 'image')));
        expect(actual).assertEqual(runOptionField(0, 'image'));
        logAssertion(DOMAIN, TAG, String(actual === runOptionStats('last-image')), 'false');
        expect(actual === runOptionStats('last-image')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2000
     * @tc.name: testOptionReal0020
     * @tc.desc: Verify the last option image is icon_share
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0020', 0, async (done: Function) => {
      await runCase('testOptionReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0020 begin');
        const actual: string = runOptionStats('last-image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'icon_share');
        logAssertion(DOMAIN, TAG, String(actual), String('icon_share'));
        expect(actual).assertEqual('icon_share');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionField(OPTION_COUNT - 1, 'image')));
        expect(actual).assertEqual(runOptionField(OPTION_COUNT - 1, 'image'));
        logAssertion(DOMAIN, TAG, String(actual.endsWith('share')), 'true');
        expect(actual.endsWith('share')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2100
     * @tc.name: testOptionReal0021
     * @tc.desc: Verify the four option images are pairwise distinct
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0021', 0, async (done: Function) => {
      await runCase('testOptionReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0021 begin');
        const actual: string = runOptionStats('distinct-image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '4');
        logAssertion(DOMAIN, TAG, String(actual), String('4'));
        expect(actual).assertEqual('4');
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionStats('count')));
        expect(actual).assertEqual(runOptionStats('count'));
        logAssertion(DOMAIN, TAG, String(actual === '3'), 'false');
        expect(actual === '3').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2200
     * @tc.name: testOptionReal0022
     * @tc.desc: Verify option 0 and option 1 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0022', 0, async (done: Function) => {
      await runCase('testOptionReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0022 begin');
        const row0: string = runOptionRow(0);
        const row1: string = runOptionRow(1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row1, 'different');
        logAssertion(DOMAIN, TAG, String(row0 === row1), 'false');
        expect(row0 === row1).assertFalse();
        logAssertion(DOMAIN, TAG, String(row0.split('|')[0] === row1.split('|')[0]), 'false');
        expect(row0.split('|')[0] === row1.split('|')[0]).assertFalse();
        logAssertion(DOMAIN, TAG, String(row0.split('|')[1] === row1.split('|')[1]), 'false');
        expect(row0.split('|')[1] === row1.split('|')[1]).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2300
     * @tc.name: testOptionReal0023
     * @tc.desc: Verify option 1 and option 2 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0023', 0, async (done: Function) => {
      await runCase('testOptionReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0023 begin');
        const row1: string = runOptionRow(1);
        const row2: string = runOptionRow(2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row1, row2, 'different');
        logAssertion(DOMAIN, TAG, String(row1 === row2), 'false');
        expect(row1 === row2).assertFalse();
        logAssertion(DOMAIN, TAG, String(row1.split('|')[0] === row2.split('|')[0]), 'false');
        expect(row1.split('|')[0] === row2.split('|')[0]).assertFalse();
        logAssertion(DOMAIN, TAG, String(row1.split('|')[1] === row2.split('|')[1]), 'false');
        expect(row1.split('|')[1] === row2.split('|')[1]).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2400
     * @tc.name: testOptionReal0024
     * @tc.desc: Verify option 2 and option 3 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0024', 0, async (done: Function) => {
      await runCase('testOptionReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0024 begin');
        const row2: string = runOptionRow(2);
        const row3: string = runOptionRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row2, row3, 'different');
        logAssertion(DOMAIN, TAG, String(row2 === row3), 'false');
        expect(row2 === row3).assertFalse();
        logAssertion(DOMAIN, TAG, String(row2.split('|')[0] === row3.split('|')[0]), 'false');
        expect(row2.split('|')[0] === row3.split('|')[0]).assertFalse();
        logAssertion(DOMAIN, TAG, String(row2.split('|')[1] === row3.split('|')[1]), 'false');
        expect(row2.split('|')[1] === row3.split('|')[1]).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2500
     * @tc.name: testOptionReal0025
     * @tc.desc: Verify option 0 and option 3 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0025', 0, async (done: Function) => {
      await runCase('testOptionReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0025 begin');
        const row0: string = runOptionRow(0);
        const row3: string = runOptionRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row3, 'different');
        logAssertion(DOMAIN, TAG, String(row0 === row3), 'false');
        expect(row0 === row3).assertFalse();
        logAssertion(DOMAIN, TAG, String(row0.split('|')[0]), String('ic_collect'));
        expect(row0.split('|')[0]).assertEqual('ic_collect');
        logAssertion(DOMAIN, TAG, String(row3.split('|')[0]), String('icon_share'));
        expect(row3.split('|')[0]).assertEqual('icon_share');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2600
     * @tc.name: testOptionReal0026
     * @tc.desc: Verify option 0 and option 2 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0026', 0, async (done: Function) => {
      await runCase('testOptionReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0026 begin');
        const row0: string = runOptionRow(0);
        const row2: string = runOptionRow(2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row0, row2, 'different');
        logAssertion(DOMAIN, TAG, String(row0 === row2), 'false');
        expect(row0 === row2).assertFalse();
        logAssertion(DOMAIN, TAG, String(row0.split('|')[0] === row2.split('|')[0]), 'false');
        expect(row0.split('|')[0] === row2.split('|')[0]).assertFalse();
        logAssertion(DOMAIN, TAG, String(row2.startsWith('icon_')), 'true');
        expect(row2.startsWith('icon_')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2700
     * @tc.name: testOptionReal0027
     * @tc.desc: Verify option 1 and option 3 differ in both image and caption
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0027', 0, async (done: Function) => {
      await runCase('testOptionReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0027 begin');
        const row1: string = runOptionRow(1);
        const row3: string = runOptionRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', row1, row3, 'different');
        logAssertion(DOMAIN, TAG, String(row1 === row3), 'false');
        expect(row1 === row3).assertFalse();
        logAssertion(DOMAIN, TAG, String(row1.split('|')[1]), String('string:download'));
        expect(row1.split('|')[1]).assertEqual('string:download');
        logAssertion(DOMAIN, TAG, String(row3.split('|')[1]), String('string:share'));
        expect(row3.split('|')[1]).assertEqual('string:share');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2800
     * @tc.name: testOptionReal0028
     * @tc.desc: Verify exactly one caption is a literal and three are string resources
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0028', 0, async (done: Function) => {
      await runCase('testOptionReal0028', async (): Promise<void> => {
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
        logAssertion(DOMAIN, TAG, String(literalCount), String(1));
        expect(literalCount).assertEqual(1);
        logAssertion(DOMAIN, TAG, String(stringCount), String(3));
        expect(stringCount).assertEqual(3);
        logAssertion(DOMAIN, TAG, String(literalCount + stringCount), String(4));
        expect(literalCount + stringCount).assertEqual(4);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_2900
     * @tc.name: testOptionReal0029
     * @tc.desc: Verify no caption falls back to the other marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0029', 0, async (done: Function) => {
      await runCase('testOptionReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0029 begin');
        const first: string = runOptionField(0, 'text');
        const second: string = runOptionField(1, 'text');
        const third: string = runOptionField(2, 'text');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s|%{public}s|%{public}s expected=%{public}s',
          first, second, third, 'no other marker');
        logAssertion(DOMAIN, TAG, String(first === 'string:other'), 'false');
        expect(first === 'string:other').assertFalse();
        logAssertion(DOMAIN, TAG, String(second === 'string:other'), 'false');
        expect(second === 'string:other').assertFalse();
        logAssertion(DOMAIN, TAG, String(third === 'string:other'), 'false');
        expect(third === 'string:other').assertFalse();
        logAssertion(DOMAIN, TAG, String(runOptionField(3, 'text') === 'string:other'), 'false');
        expect(runOptionField(3, 'text') === 'string:other').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3000
     * @tc.name: testOptionReal0030
     * @tc.desc: Verify no option image falls back to the other marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0030', 0, async (done: Function) => {
      await runCase('testOptionReal0030', async (): Promise<void> => {
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
        logAssertion(DOMAIN, TAG, String(otherCount), String(0));
        expect(otherCount).assertEqual(0);
        logAssertion(DOMAIN, TAG, String(images.indexOf('ic_collect')), String(0));
        expect(images.indexOf('ic_collect')).assertEqual(0);
        logAssertion(DOMAIN, TAG, String(images.indexOf('icon_share')), String(3));
        expect(images.indexOf('icon_share')).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3100
     * @tc.name: testOptionReal0031
     * @tc.desc: Verify the composed row equals image field plus text field
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0031', 0, async (done: Function) => {
      await runCase('testOptionReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0031 begin');
        const composed: string = runOptionField(0, 'image') + '|' + runOptionField(0, 'text');
        const row: string = runOptionRow(0);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', composed, row);
        logAssertion(DOMAIN, TAG, String(composed), String(row));
        expect(composed).assertEqual(row);
        logAssertion(DOMAIN, TAG, String(composed.split('|').length), String(2));
        expect(composed.split('|').length).assertEqual(2);
        logAssertion(DOMAIN, TAG, String(row.startsWith('ic_collect|')), 'true');
        expect(row.startsWith('ic_collect|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3200
     * @tc.name: testOptionReal0032
     * @tc.desc: Verify the last composed row equals image field plus text field
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0032', 0, async (done: Function) => {
      await runCase('testOptionReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0032 begin');
        const composed: string = runOptionField(3, 'image') + '|' + runOptionField(3, 'text');
        const row: string = runOptionRow(3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', composed, row);
        logAssertion(DOMAIN, TAG, String(composed), String(row));
        expect(composed).assertEqual(row);
        logAssertion(DOMAIN, TAG, String(composed), String('icon_share|string:share'));
        expect(composed).assertEqual('icon_share|string:share');
        logAssertion(DOMAIN, TAG, String(row), String(runOptionRow(OPTION_COUNT - 1)));
        expect(row).assertEqual(runOptionRow(OPTION_COUNT - 1));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3300
     * @tc.name: testOptionReal0033
     * @tc.desc: Verify the stats helpers agree with the per row helpers on both edges
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0033', 0, async (done: Function) => {
      await runCase('testOptionReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0033 begin');
        const firstStats: string = runOptionStats('first-image');
        const firstRow: string = runOptionRow(0).split('|')[0];
        const lastStats: string = runOptionStats('last-image');
        const lastRow: string = runOptionRow(OPTION_COUNT - 1).split('|')[0];
        hilog.info(DOMAIN, TAG, 'actual=%{public}s#%{public}s expected=%{public}s', firstStats, lastStats,
          'ic_collect#icon_share');
        logAssertion(DOMAIN, TAG, String(firstStats), String(firstRow));
        expect(firstStats).assertEqual(firstRow);
        logAssertion(DOMAIN, TAG, String(lastStats), String(lastRow));
        expect(lastStats).assertEqual(lastRow);
        logAssertion(DOMAIN, TAG, String(firstStats === lastStats), 'false');
        expect(firstStats === lastStats).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3400
     * @tc.name: testOptionReal0034
     * @tc.desc: Verify an unknown stats kind resolves to the unknown marker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testOptionReal0034', 0, async (done: Function) => {
      await runCase('testOptionReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0034 begin');
        const actual: string = runOptionStats('median-image');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'unknown');
        logAssertion(DOMAIN, TAG, String(actual), String('unknown'));
        expect(actual).assertEqual('unknown');
        logAssertion(DOMAIN, TAG, String(actual === runOptionStats('count')), 'false');
        expect(actual === runOptionStats('count')).assertFalse();
        logAssertion(DOMAIN, TAG, String(actual), String(runOptionStats('badge')));
        expect(actual).assertEqual(runOptionStats('badge'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_OPTION_01_3500
     * @tc.name: testOptionReal0035
     * @tc.desc: Verify the whole strip composes into the frozen four row snapshot
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testOptionReal0035', 0, async (done: Function) => {
      await runCase('testOptionReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0035 begin');
        const joined: string = runOptionRow(0) + ';' + runOptionRow(1) + ';' + runOptionRow(2) + ';' +
          runOptionRow(3);
        const expected: string = 'ic_collect|literal:999+;ic_download|string:download;' +
          'icon_comments|string:comment;icon_share|string:share';
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', joined, expected);
        logAssertion(DOMAIN, TAG, String(joined), String(expected));
        expect(joined).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(joined.split(';').length), String(4));
        expect(joined.split(';').length).assertEqual(4);
        logAssertion(DOMAIN, TAG, String(joined.startsWith('ic_collect|literal:999+;')), 'true');
        expect(joined.startsWith('ic_collect|literal:999+;')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testOptionReal0035 end');
      }, done);
    });

  })
}
