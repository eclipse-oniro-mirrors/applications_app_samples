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
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_ViewItemModelMatrix]';

export default function viewItemModelMatrixTest() {
  describe('viewItemModelMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0001
     * @tc.name test_viewItemModelMatrix_c0001
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0001 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 0;
      item.name = 'view_name_' + 0;
      item.des = 'view_des_' + 0;
      item.type = 0 % 5;
      item.image = 'view_image_' + 0;
      expect(item.id).assertEqual('view_id_' + 0);
      expect(item.name).assertEqual('view_name_' + 0);
      expect(item.type).assertEqual(0 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0002
     * @tc.name test_viewItemModelMatrix_c0002
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0002 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 1;
      item.name = 'view_name_' + 1;
      item.des = 'view_des_' + 1;
      item.type = 1 % 5;
      item.image = 'view_image_' + 1;
      expect(item.id).assertEqual('view_id_' + 1);
      expect(item.name).assertEqual('view_name_' + 1);
      expect(item.type).assertEqual(1 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0003
     * @tc.name test_viewItemModelMatrix_c0003
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0003 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 2;
      item.name = 'view_name_' + 2;
      item.des = 'view_des_' + 2;
      item.type = 2 % 5;
      item.image = 'view_image_' + 2;
      expect(item.id).assertEqual('view_id_' + 2);
      expect(item.name).assertEqual('view_name_' + 2);
      expect(item.type).assertEqual(2 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0004
     * @tc.name test_viewItemModelMatrix_c0004
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0004 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 3;
      item.name = 'view_name_' + 3;
      item.des = 'view_des_' + 3;
      item.type = 3 % 5;
      item.image = 'view_image_' + 3;
      expect(item.id).assertEqual('view_id_' + 3);
      expect(item.name).assertEqual('view_name_' + 3);
      expect(item.type).assertEqual(3 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0005
     * @tc.name test_viewItemModelMatrix_c0005
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0005 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 4;
      item.name = 'view_name_' + 4;
      item.des = 'view_des_' + 4;
      item.type = 4 % 5;
      item.image = 'view_image_' + 4;
      expect(item.id).assertEqual('view_id_' + 4);
      expect(item.name).assertEqual('view_name_' + 4);
      expect(item.type).assertEqual(4 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0006
     * @tc.name test_viewItemModelMatrix_c0006
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0006 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 5;
      item.name = 'view_name_' + 5;
      item.des = 'view_des_' + 5;
      item.type = 5 % 5;
      item.image = 'view_image_' + 5;
      expect(item.id).assertEqual('view_id_' + 5);
      expect(item.name).assertEqual('view_name_' + 5);
      expect(item.type).assertEqual(5 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0128
     * @tc.name test_viewItemModelMatrix_c0128
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0128 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 127;
      item.name = 'view_name_' + 127;
      item.des = 'view_des_' + 127;
      item.type = 127 % 5;
      item.image = 'view_image_' + 127;
      expect(item.id).assertEqual('view_id_' + 127);
      expect(item.name).assertEqual('view_name_' + 127);
      expect(item.type).assertEqual(127 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_VIEWITEM_MATRIX_0256
     * @tc.name test_viewItemModelMatrix_c0256
     * @tc.desc Verify ViewItemModelMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_viewItemModelMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0256 begin');
      const item: ViewItem = new ViewItem();
      expect(item.id).assertEqual('');
      expect(item.name).assertEqual('');
      expect(item.des).assertEqual('');
      expect(item.type).assertEqual(0);
      expect(item.image).assertEqual('');
      item.id = 'view_id_' + 255;
      item.name = 'view_name_' + 255;
      item.des = 'view_des_' + 255;
      item.type = 255 % 5;
      item.image = 'view_image_' + 255;
      expect(item.id).assertEqual('view_id_' + 255);
      expect(item.name).assertEqual('view_name_' + 255);
      expect(item.type).assertEqual(255 % 5);
      const second: ViewItem = new ViewItem();
      expect(second.id).assertEqual('');
      expect(second.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_viewItemModelMatrix_c0256 end');
    });

  });
}
