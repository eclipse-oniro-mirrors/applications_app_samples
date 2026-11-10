/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { UserFileDataItem } from '../../../main/ets/base/UserFileDataItem';
import { ViewType } from '../../../main/ets/models/ViewType';
import { MediaConstants } from '../../../main/ets/constants/MediaConstants';

const TAG = '[Sample_PhotosUserFileDataItemMatrixTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemMatrixTest(): void {
  describe('PhotosUserFileDataItemMatrixTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0001
     * @tc.name      testPhotosUserFileDataItemInitMatrix0001
     * @tc.desc      Initializes media item matrix sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_0', ['arg_a_0', 'arg_b_0'], 'device_0', 3);
      expect(item.selections).assertEqual('selection_0');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_0');
      expect(item.index).assertEqual(3);
      expect(item.hashIndex).assertEqual(3);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0002
     * @tc.name      testPhotosUserFileDataItemInitMatrix0002
     * @tc.desc      Initializes media item matrix sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_1', ['arg_a_1', 'arg_b_1'], 'device_1', 4);
      expect(item.selections).assertEqual('selection_1');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_1');
      expect(item.index).assertEqual(4);
      expect(item.hashIndex).assertEqual(4);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0003
     * @tc.name      testPhotosUserFileDataItemInitMatrix0003
     * @tc.desc      Initializes media item matrix sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_2', ['arg_a_2', 'arg_b_2'], 'device_2', 5);
      expect(item.selections).assertEqual('selection_2');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_2');
      expect(item.index).assertEqual(5);
      expect(item.hashIndex).assertEqual(5);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0004
     * @tc.name      testPhotosUserFileDataItemInitMatrix0004
     * @tc.desc      Initializes media item matrix sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_3', ['arg_a_3', 'arg_b_3'], 'device_3', 6);
      expect(item.selections).assertEqual('selection_3');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_3');
      expect(item.index).assertEqual(6);
      expect(item.hashIndex).assertEqual(6);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
