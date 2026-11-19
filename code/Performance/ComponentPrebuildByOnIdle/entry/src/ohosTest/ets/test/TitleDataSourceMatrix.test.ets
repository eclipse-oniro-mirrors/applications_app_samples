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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TitleDataSource } from '@ohos/customreusablepool/src/main/ets/data/TitleDataSource';
import { CountingListener } from './shared/CountingListener';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_TitleDataSourceMatrix]';

export default function titleDataSourceMatrixTest() {
  describe('titleDataSourceMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0001
     * @tc.name test_titleDataSourceMatrix_c0001
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0001 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (0 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 0 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 0 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 0);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 0);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0002
     * @tc.name test_titleDataSourceMatrix_c0002
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0002 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (1 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 1 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 1 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 1);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 1);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0003
     * @tc.name test_titleDataSourceMatrix_c0003
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0003 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (2 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 2 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 2 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 2);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 2);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0004
     * @tc.name test_titleDataSourceMatrix_c0004
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0004 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (3 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 3 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 3 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 3);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 3);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0005
     * @tc.name test_titleDataSourceMatrix_c0005
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0005 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (4 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 4 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 4 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 4);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 4);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0006
     * @tc.name test_titleDataSourceMatrix_c0006
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0006 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (5 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 5 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 5 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 5);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 5);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0128
     * @tc.name test_titleDataSourceMatrix_c0128
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0128 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (127 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 127 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 127 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 127);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 127);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_TITLE_MATRIX_0256
     * @tc.name test_titleDataSourceMatrix_c0256
     * @tc.desc Verify TitleDataSourceMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_titleDataSourceMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0256 begin');
      const data: TitleDataSource = new TitleDataSource();
      const addCount: number = (255 % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        data.addItem('title_' + 255 + '_' + n);
      }
      expect(data.totalCount()).assertEqual(addCount);
      expect(data.getData(addCount - 1)).assertEqual('title_' + 255 + '_' + (addCount - 1));
      const first: CountingListener = new CountingListener();
      data.registerDataChangeListener(first);
      data.addItem('extra_1_' + 255);
      expect(first.addCount).assertEqual(1);
      expect(first.lastAddIndex).assertEqual(addCount);
      const second: CountingListener = new CountingListener();
      data.registerDataChangeListener(second);
      data.unregisterDataChangeListener(second);
      data.addItem('extra_2_' + 255);
      expect(second.addCount).assertEqual(0);
      expect(first.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_titleDataSourceMatrix_c0256 end');
    });

  });
}
