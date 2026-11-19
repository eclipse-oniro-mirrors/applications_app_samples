/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MemoInfo } from '../../../main/ets/pages/MemoInfo';
import { MEMO_DATA } from '../../../main/ets/pages/MockData';
import Constants from '../../../main/ets/constants/Constants';

const DOMAIN: number = 0xF814;
const TAG: string = 'MemoDataModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const EXPECTED_TITLES: string[] =
  ['One step', 'Love is love', 'To solve a problem', 'Lunches', 'Computer Lessons', 'Morning Exercise',
    'Breakfast', 'Go to work'];
const EXPECTED_IMAGE_SOURCES: string[] =
  ['app.media.expanded_title_ic_public_app5', 'app.media.expanded_title_drink_coffee',
    'app.media.expanded_title_cook_picture', 'app.media.expanded_title_ic_public_app12',
    'app.media.expanded_title_dinner_food', 'app.media.expanded_title_ic_public_game1'];

export default function memoDataModelCoreTest(): void {
  describe('MemoDataModelCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0501
     * @tc.name      testMemoDataModelCore0501
     * @tc.desc      Verify mock memo data exposes eight items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0501 begin');
      const actual: number = MEMO_DATA.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=8`);
      expect(actual).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testMemoDataModelCore0501 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0502
     * @tc.name      testMemoDataModelCore0502
     * @tc.desc      Verify every mock memo id is unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0502 begin');
      const ids: string[] = MEMO_DATA.map((item: MemoInfo) => item.memoId);
      const unique: Set<string> = new Set<string>(ids);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unique.size=${unique.size}, expected=MEMO_DATA.length`);
      expect(unique.size).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0502 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0503
     * @tc.name      testMemoDataModelCore0503
     * @tc.desc      Verify every mock memo title is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0503 begin');
      let nonEmpty: number = 0;
      for (const item of MEMO_DATA) {
        if (item.title.length > 0) {
          nonEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nonEmpty=${nonEmpty}, expected=MEMO_DATA.length`);
      expect(nonEmpty).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0503 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0504
     * @tc.name      testMemoDataModelCore0504
     * @tc.desc      Verify every mock memo time label is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0504 begin');
      let nonEmpty: number = 0;
      for (const item of MEMO_DATA) {
        if (item.time.length > 0) {
          nonEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nonEmpty=${nonEmpty}, expected=MEMO_DATA.length`);
      expect(nonEmpty).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0504 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0505
     * @tc.name      testMemoDataModelCore0505
     * @tc.desc      Verify every mock memo content is a non-empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0505 begin');
      let nonEmpty: number = 0;
      for (const item of MEMO_DATA) {
        if (item.content.length > 0) {
          nonEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nonEmpty=${nonEmpty}, expected=MEMO_DATA.length`);
      expect(nonEmpty).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0505 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0506
     * @tc.name      testMemoDataModelCore0506
     * @tc.desc      Verify six mock memos carry an image and two do not.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0506 begin');
      let withImage: number = 0;
      for (const item of MEMO_DATA) {
        if (item.imageSrc.length > 0) {
          withImage++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual withImage=${withImage}, expected=6`);
      expect(withImage).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA.length - withImage=${MEMO_DATA.length - withImage}`);
      expect(MEMO_DATA.length - withImage).assertEqual(2);
      log('testMemoDataModelCore0506 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0507
     * @tc.name      testMemoDataModelCore0507
     * @tc.desc      Verify image sources of memos follow the app.media prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0507 begin');
      let valid: number = 0;
      for (const item of MEMO_DATA) {
        if (item.imageSrc.length > 0 && item.imageSrc.startsWith('app.media.')) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual valid=${valid}, expected=6`);
      expect(valid).assertEqual(6);
      log('testMemoDataModelCore0507 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0508
     * @tc.name      testMemoDataModelCore0508
     * @tc.desc      Verify first mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0508 begin');
      const item: MemoInfo = MEMO_DATA[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972443'`);
      expect(item.memoId).assertEqual('1646121972443');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[0]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.time=${item.time}, expected='Just now'`);
      expect(item.time).assertEqual('Just now');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.content=${item.content}`);
      expect(item.content).assertEqual('For analyzing the data gathered in the previous experiment.');
      log('testMemoDataModelCore0508 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0509
     * @tc.name      testMemoDataModelCore0509
     * @tc.desc      Verify second mock memo has no image and matches its definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0509 begin');
      const item: MemoInfo = MEMO_DATA[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972444'`);
      expect(item.memoId).assertEqual('1646121972444');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[1]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}, expected=''`);
      expect(item.imageSrc).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.content=${item.content}`);
      expect(item.content).assertEqual('Start whenever you want.');
      log('testMemoDataModelCore0509 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0510
     * @tc.name      testMemoDataModelCore0510
     * @tc.desc      Verify third mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0510 begin');
      const item: MemoInfo = MEMO_DATA[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972445'`);
      expect(item.memoId).assertEqual('1646121972445');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[2]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.time=${item.time}, expected='Yesterday'`);
      expect(item.time).assertEqual('Yesterday');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[1]);
      log('testMemoDataModelCore0510 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0511
     * @tc.name      testMemoDataModelCore0511
     * @tc.desc      Verify fourth mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0511 begin');
      const item: MemoInfo = MEMO_DATA[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972446'`);
      expect(item.memoId).assertEqual('1646121972446');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[3]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.time=${item.time}, expected='02.18.2024'`);
      expect(item.time).assertEqual('02.18.2024');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[2]);
      log('testMemoDataModelCore0511 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0512
     * @tc.name      testMemoDataModelCore0512
     * @tc.desc      Verify fifth mock memo has no image and matches its definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0512 begin');
      const item: MemoInfo = MEMO_DATA[4];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972447'`);
      expect(item.memoId).assertEqual('1646121972447');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[4]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}, expected=''`);
      expect(item.imageSrc).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.content=${item.content}, expected='Practice typing daily'`);
      expect(item.content).assertEqual('Practice typing daily');
      log('testMemoDataModelCore0512 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0513
     * @tc.name      testMemoDataModelCore0513
     * @tc.desc      Verify sixth mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0513 begin');
      const item: MemoInfo = MEMO_DATA[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972448'`);
      expect(item.memoId).assertEqual('1646121972448');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[5]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[3]);
      log('testMemoDataModelCore0513 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0514
     * @tc.name      testMemoDataModelCore0514
     * @tc.desc      Verify seventh mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0514 begin');
      const item: MemoInfo = MEMO_DATA[6];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972449'`);
      expect(item.memoId).assertEqual('1646121972449');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[6]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[6]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.time=${item.time}, expected='02.17.2024'`);
      expect(item.time).assertEqual('02.17.2024');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[4]);
      log('testMemoDataModelCore0514 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0515
     * @tc.name      testMemoDataModelCore0515
     * @tc.desc      Verify eighth mock memo fields match the sample definition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0515 begin');
      const item: MemoInfo = MEMO_DATA[7];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.memoId=${item.memoId}, expected='1646121972450'`);
      expect(item.memoId).assertEqual('1646121972450');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=EXPECTED_TITLES[7]`);
      expect(item.title).assertEqual(EXPECTED_TITLES[7]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.time=${item.time}, expected='02.15.2024'`);
      expect(item.time).assertEqual('02.15.2024');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.imageSrc=${item.imageSrc}`);
      expect(item.imageSrc).assertEqual(EXPECTED_IMAGE_SOURCES[5]);
      log('testMemoDataModelCore0515 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0516
     * @tc.name      testMemoDataModelCore0516
     * @tc.desc      Verify sub title constant stays consistent with mock data size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0516 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MEMO_SUB_TITLE=${Constants.MEMO_SUB_TITLE}`);
      expect(Constants.MEMO_SUB_TITLE).assertEqual(MEMO_DATA.length + ' notes');
      log('testMemoDataModelCore0516 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0517
     * @tc.name      testMemoDataModelCore0517
     * @tc.desc      Verify every mock memo id follows the timestamp prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0517 begin');
      let valid: number = 0;
      for (const item of MEMO_DATA) {
        if (item.memoId.startsWith('16461219')) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual valid=${valid}, expected=MEMO_DATA.length`);
      expect(valid).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0517 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0518
     * @tc.name      testMemoDataModelCore0518
     * @tc.desc      Verify MemoInfo constructor stores all five fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0518 begin');
      const memo: MemoInfo = new MemoInfo('id_new', 'New title', 'Now', 'app.media.icon', 'New content');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.memoId=${memo.memoId}, expected='id_new'`);
      expect(memo.memoId).assertEqual('id_new');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.title=${memo.title}, expected='New title'`);
      expect(memo.title).assertEqual('New title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.time=${memo.time}, expected='Now'`);
      expect(memo.time).assertEqual('Now');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.imageSrc=${memo.imageSrc}, expected='app.media.icon'`);
      expect(memo.imageSrc).assertEqual('app.media.icon');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.content=${memo.content}, expected='New content'`);
      expect(memo.content).assertEqual('New content');
      log('testMemoDataModelCore0518 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0519
     * @tc.name      testMemoDataModelCore0519
     * @tc.desc      Verify MemoInfo constructor accepts empty field values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0519 begin');
      const memo: MemoInfo = new MemoInfo('', '', '', '', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.memoId=${memo.memoId}, expected=''`);
      expect(memo.memoId).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.title=${memo.title}, expected=''`);
      expect(memo.title).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.time=${memo.time}, expected=''`);
      expect(memo.time).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.imageSrc=${memo.imageSrc}, expected=''`);
      expect(memo.imageSrc).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.content=${memo.content}, expected=''`);
      expect(memo.content).assertEqual('');
      log('testMemoDataModelCore0519 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0520
     * @tc.name      testMemoDataModelCore0520
     * @tc.desc      Verify MemoInfo instances do not share mutable state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0520 begin');
      const first: MemoInfo = new MemoInfo('id_a', 'Title A', 'Time A', '', 'Content A');
      const second: MemoInfo = new MemoInfo('id_b', 'Title B', 'Time B', '', 'Content B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.title=${first.title}, expected='Title A'`);
      expect(first.title).assertEqual('Title A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.title=${second.title}, expected='Title B'`);
      expect(second.title).assertEqual('Title B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${first.memoId === second.memoId}`);
      expect(first.memoId === second.memoId).assertFalse();
      log('testMemoDataModelCore0520 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0521
     * @tc.name      testMemoDataModelCore0521
     * @tc.desc      Verify MemoInfo instance is recognized by instanceof.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0521 begin');
      const memo: MemoInfo = new MemoInfo('id_x', 'T', 'Time', '', 'C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue memo instanceof MemoInfo=${memo instanceof MemoInfo}`);
      expect(memo instanceof MemoInfo).assertTrue();
      log('testMemoDataModelCore0521 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0522
     * @tc.name      testMemoDataModelCore0522
     * @tc.desc      Verify every mock data element is a MemoInfo instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0522 begin');
      let valid: number = 0;
      for (const item of MEMO_DATA) {
        if (item instanceof MemoInfo) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual valid=${valid}, expected=MEMO_DATA.length`);
      expect(valid).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0522 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0523
     * @tc.name      testMemoDataModelCore0523
     * @tc.desc      Verify mock data length is exposed as a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0523 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA.length=${typeof MEMO_DATA.length}`);
      expect(typeof MEMO_DATA.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue MEMO_DATA.length > 0=${MEMO_DATA.length > 0}`);
      expect(MEMO_DATA.length > 0).assertTrue();
      log('testMemoDataModelCore0523 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0524
     * @tc.name      testMemoDataModelCore0524
     * @tc.desc      Verify first mock memo field types are all strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0524 begin');
      const item: MemoInfo = MEMO_DATA[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.memoId=${typeof item.memoId}, expected='string'`);
      expect(typeof item.memoId).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.title=${typeof item.title}, expected='string'`);
      expect(typeof item.title).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.time=${typeof item.time}, expected='string'`);
      expect(typeof item.time).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.imageSrc=${typeof item.imageSrc}`);
      expect(typeof item.imageSrc).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.content=${typeof item.content}`);
      expect(typeof item.content).assertEqual('string');
      log('testMemoDataModelCore0524 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0525
     * @tc.name      testMemoDataModelCore0525
     * @tc.desc      Verify every mock memo id is a 13 digit timestamp string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0525 begin');
      let valid: number = 0;
      for (const item of MEMO_DATA) {
        if (item.memoId.length === 13) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual valid=${valid}, expected=MEMO_DATA.length`);
      expect(valid).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0525 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0526
     * @tc.name      testMemoDataModelCore0526
     * @tc.desc      Verify date styled time labels follow the month prefix format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0526 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[3].time.startsWith('02.')}`);
      expect(MEMO_DATA[3].time.startsWith('02.')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[4].time.startsWith('02.')}`);
      expect(MEMO_DATA[4].time.startsWith('02.')).assertTrue();
      log('testMemoDataModelCore0526 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0527
     * @tc.name      testMemoDataModelCore0527
     * @tc.desc      Verify the two imageless memos are the expected sample ids.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0527 begin');
      const imageless: string[] = MEMO_DATA.filter((item: MemoInfo) => item.imageSrc.length === 0)
        .map((item: MemoInfo) => item.memoId);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual imageless.length=${imageless.length}, expected=2`);
      expect(imageless.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${imageless.indexOf('1646121972444') >= 0}`);
      expect(imageless.indexOf('1646121972444') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${imageless.indexOf('1646121972447') >= 0}`);
      expect(imageless.indexOf('1646121972447') >= 0).assertTrue();
      log('testMemoDataModelCore0527 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0528
     * @tc.name      testMemoDataModelCore0528
     * @tc.desc      Verify constructor keeps title and content field order distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0528 begin');
      const memo: MemoInfo = new MemoInfo('id_order', 'TITLE_FIELD', 'TIME_FIELD', 'IMAGE_FIELD',
        'CONTENT_FIELD');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.title=${memo.title}, expected='TITLE_FIELD'`);
      expect(memo.title).assertEqual('TITLE_FIELD');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual memo.content=${memo.content}, expected='CONTENT_FIELD'`);
      expect(memo.content).assertEqual('CONTENT_FIELD');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse memo.title === memo.content=${memo.title === memo.content}`);
      expect(memo.title === memo.content).assertFalse();
      log('testMemoDataModelCore0528 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0529
     * @tc.name      testMemoDataModelCore0529
     * @tc.desc      Verify each mock memo title differs from its content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0529 begin');
      let distinct: number = 0;
      for (const item of MEMO_DATA) {
        if (item.title !== item.content) {
          distinct++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual distinct=${distinct}, expected=MEMO_DATA.length`);
      expect(distinct).assertEqual(MEMO_DATA.length);
      log('testMemoDataModelCore0529 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMODATA_0530
     * @tc.name      testMemoDataModelCore0530
     * @tc.desc      Verify image carrying memos use six distinct media resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataModelCore0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataModelCore0530 begin');
      const sources: string[] = MEMO_DATA.filter((item: MemoInfo) => item.imageSrc.length > 0)
        .map((item: MemoInfo) => item.imageSrc);
      const unique: Set<string> = new Set<string>(sources);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unique.size=${unique.size}, expected=6`);
      expect(unique.size).assertEqual(6);
      log('testMemoDataModelCore0530 end');
    })
  })
}
