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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_0', ['arg_a_0', 'arg_b_0'], 'device_0', 3);
      expect(item.selections).assertEqual('selection_0');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_0');
      expect(item.index).assertEqual(3);
      expect(item.hashIndex).assertEqual(3);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_1', ['arg_a_1', 'arg_b_1'], 'device_1', 4);
      expect(item.selections).assertEqual('selection_1');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_1');
      expect(item.index).assertEqual(4);
      expect(item.hashIndex).assertEqual(4);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_2', ['arg_a_2', 'arg_b_2'], 'device_2', 5);
      expect(item.selections).assertEqual('selection_2');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_2');
      expect(item.index).assertEqual(5);
      expect(item.hashIndex).assertEqual(5);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_3', ['arg_a_3', 'arg_b_3'], 'device_3', 6);
      expect(item.selections).assertEqual('selection_3');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_3');
      expect(item.index).assertEqual(6);
      expect(item.hashIndex).assertEqual(6);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0005
     * @tc.name      testPhotosUserFileDataItemInitMatrix0005
     * @tc.desc      Initializes media item matrix sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_4', ['arg_a_4', 'arg_b_4'], 'device_4', 7);
      expect(item.selections).assertEqual('selection_4');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_4');
      expect(item.index).assertEqual(7);
      expect(item.hashIndex).assertEqual(7);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0006
     * @tc.name      testPhotosUserFileDataItemInitMatrix0006
     * @tc.desc      Initializes media item matrix sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_5', ['arg_a_5', 'arg_b_5'], 'device_5', 8);
      expect(item.selections).assertEqual('selection_5');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_5');
      expect(item.index).assertEqual(8);
      expect(item.hashIndex).assertEqual(8);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0007
     * @tc.name      testPhotosUserFileDataItemInitMatrix0007
     * @tc.desc      Initializes media item matrix sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_6', ['arg_a_6', 'arg_b_6'], 'device_6', 9);
      expect(item.selections).assertEqual('selection_6');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_6');
      expect(item.index).assertEqual(9);
      expect(item.hashIndex).assertEqual(9);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0008
     * @tc.name      testPhotosUserFileDataItemInitMatrix0008
     * @tc.desc      Initializes media item matrix sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_7', ['arg_a_7', 'arg_b_7'], 'device_7', 10);
      expect(item.selections).assertEqual('selection_7');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_7');
      expect(item.index).assertEqual(10);
      expect(item.hashIndex).assertEqual(10);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0009
     * @tc.name      testPhotosUserFileDataItemInitMatrix0009
     * @tc.desc      Initializes media item matrix sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_8', ['arg_a_8', 'arg_b_8'], 'device_8', 11);
      expect(item.selections).assertEqual('selection_8');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_8');
      expect(item.index).assertEqual(11);
      expect(item.hashIndex).assertEqual(11);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0010
     * @tc.name      testPhotosUserFileDataItemInitMatrix0010
     * @tc.desc      Initializes media item matrix sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_9', ['arg_a_9', 'arg_b_9'], 'device_9', 12);
      expect(item.selections).assertEqual('selection_9');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_9');
      expect(item.index).assertEqual(12);
      expect(item.hashIndex).assertEqual(12);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0011
     * @tc.name      testPhotosUserFileDataItemInitMatrix0011
     * @tc.desc      Initializes media item matrix sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_10', ['arg_a_10', 'arg_b_10'], 'device_10', 13);
      expect(item.selections).assertEqual('selection_10');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_10');
      expect(item.index).assertEqual(13);
      expect(item.hashIndex).assertEqual(13);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0012
     * @tc.name      testPhotosUserFileDataItemInitMatrix0012
     * @tc.desc      Initializes media item matrix sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_11', ['arg_a_11', 'arg_b_11'], 'device_11', 14);
      expect(item.selections).assertEqual('selection_11');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_11');
      expect(item.index).assertEqual(14);
      expect(item.hashIndex).assertEqual(14);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0013
     * @tc.name      testPhotosUserFileDataItemInitMatrix0013
     * @tc.desc      Initializes media item matrix sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_12', ['arg_a_12', 'arg_b_12'], 'device_12', 15);
      expect(item.selections).assertEqual('selection_12');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_12');
      expect(item.index).assertEqual(15);
      expect(item.hashIndex).assertEqual(15);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0014
     * @tc.name      testPhotosUserFileDataItemInitMatrix0014
     * @tc.desc      Initializes media item matrix sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_13', ['arg_a_13', 'arg_b_13'], 'device_13', 16);
      expect(item.selections).assertEqual('selection_13');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_13');
      expect(item.index).assertEqual(16);
      expect(item.hashIndex).assertEqual(16);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0015
     * @tc.name      testPhotosUserFileDataItemInitMatrix0015
     * @tc.desc      Initializes media item matrix sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_14', ['arg_a_14', 'arg_b_14'], 'device_14', 17);
      expect(item.selections).assertEqual('selection_14');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_14');
      expect(item.index).assertEqual(17);
      expect(item.hashIndex).assertEqual(17);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0016
     * @tc.name      testPhotosUserFileDataItemInitMatrix0016
     * @tc.desc      Initializes media item matrix sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_15', ['arg_a_15', 'arg_b_15'], 'device_15', 18);
      expect(item.selections).assertEqual('selection_15');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_15');
      expect(item.index).assertEqual(18);
      expect(item.hashIndex).assertEqual(18);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0017
     * @tc.name      testPhotosUserFileDataItemInitMatrix0017
     * @tc.desc      Initializes media item matrix sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_16', ['arg_a_16', 'arg_b_16'], 'device_16', 19);
      expect(item.selections).assertEqual('selection_16');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_16');
      expect(item.index).assertEqual(19);
      expect(item.hashIndex).assertEqual(19);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0018
     * @tc.name      testPhotosUserFileDataItemInitMatrix0018
     * @tc.desc      Initializes media item matrix sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_17', ['arg_a_17', 'arg_b_17'], 'device_17', 20);
      expect(item.selections).assertEqual('selection_17');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_17');
      expect(item.index).assertEqual(20);
      expect(item.hashIndex).assertEqual(20);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0019
     * @tc.name      testPhotosUserFileDataItemInitMatrix0019
     * @tc.desc      Initializes media item matrix sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_18', ['arg_a_18', 'arg_b_18'], 'device_18', 21);
      expect(item.selections).assertEqual('selection_18');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_18');
      expect(item.index).assertEqual(21);
      expect(item.hashIndex).assertEqual(21);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0020
     * @tc.name      testPhotosUserFileDataItemInitMatrix0020
     * @tc.desc      Initializes media item matrix sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_19', ['arg_a_19', 'arg_b_19'], 'device_19', 22);
      expect(item.selections).assertEqual('selection_19');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_19');
      expect(item.index).assertEqual(22);
      expect(item.hashIndex).assertEqual(22);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0021
     * @tc.name      testPhotosUserFileDataItemInitMatrix0021
     * @tc.desc      Initializes media item matrix sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_20', ['arg_a_20', 'arg_b_20'], 'device_20', 23);
      expect(item.selections).assertEqual('selection_20');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_20');
      expect(item.index).assertEqual(23);
      expect(item.hashIndex).assertEqual(23);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0022
     * @tc.name      testPhotosUserFileDataItemInitMatrix0022
     * @tc.desc      Initializes media item matrix sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_21', ['arg_a_21', 'arg_b_21'], 'device_21', 24);
      expect(item.selections).assertEqual('selection_21');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_21');
      expect(item.index).assertEqual(24);
      expect(item.hashIndex).assertEqual(24);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0023
     * @tc.name      testPhotosUserFileDataItemInitMatrix0023
     * @tc.desc      Initializes media item matrix sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_22', ['arg_a_22', 'arg_b_22'], 'device_22', 25);
      expect(item.selections).assertEqual('selection_22');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_22');
      expect(item.index).assertEqual(25);
      expect(item.hashIndex).assertEqual(25);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0024
     * @tc.name      testPhotosUserFileDataItemInitMatrix0024
     * @tc.desc      Initializes media item matrix sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_23', ['arg_a_23', 'arg_b_23'], 'device_23', 26);
      expect(item.selections).assertEqual('selection_23');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_23');
      expect(item.index).assertEqual(26);
      expect(item.hashIndex).assertEqual(26);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0025
     * @tc.name      testPhotosUserFileDataItemInitMatrix0025
     * @tc.desc      Initializes media item matrix sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_24', ['arg_a_24', 'arg_b_24'], 'device_24', 27);
      expect(item.selections).assertEqual('selection_24');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_24');
      expect(item.index).assertEqual(27);
      expect(item.hashIndex).assertEqual(27);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0026
     * @tc.name      testPhotosUserFileDataItemInitMatrix0026
     * @tc.desc      Initializes media item matrix sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_25', ['arg_a_25', 'arg_b_25'], 'device_25', 28);
      expect(item.selections).assertEqual('selection_25');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_25');
      expect(item.index).assertEqual(28);
      expect(item.hashIndex).assertEqual(28);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0027
     * @tc.name      testPhotosUserFileDataItemInitMatrix0027
     * @tc.desc      Initializes media item matrix sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_26', ['arg_a_26', 'arg_b_26'], 'device_26', 29);
      expect(item.selections).assertEqual('selection_26');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_26');
      expect(item.index).assertEqual(29);
      expect(item.hashIndex).assertEqual(29);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0028
     * @tc.name      testPhotosUserFileDataItemInitMatrix0028
     * @tc.desc      Initializes media item matrix sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_27', ['arg_a_27', 'arg_b_27'], 'device_27', 30);
      expect(item.selections).assertEqual('selection_27');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_27');
      expect(item.index).assertEqual(30);
      expect(item.hashIndex).assertEqual(30);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0029
     * @tc.name      testPhotosUserFileDataItemInitMatrix0029
     * @tc.desc      Initializes media item matrix sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_28', ['arg_a_28', 'arg_b_28'], 'device_28', 31);
      expect(item.selections).assertEqual('selection_28');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_28');
      expect(item.index).assertEqual(31);
      expect(item.hashIndex).assertEqual(31);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0030
     * @tc.name      testPhotosUserFileDataItemInitMatrix0030
     * @tc.desc      Initializes media item matrix sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_29', ['arg_a_29', 'arg_b_29'], 'device_29', 32);
      expect(item.selections).assertEqual('selection_29');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_29');
      expect(item.index).assertEqual(32);
      expect(item.hashIndex).assertEqual(32);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0031
     * @tc.name      testPhotosUserFileDataItemInitMatrix0031
     * @tc.desc      Initializes media item matrix sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_30', ['arg_a_30', 'arg_b_30'], 'device_30', 33);
      expect(item.selections).assertEqual('selection_30');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_30');
      expect(item.index).assertEqual(33);
      expect(item.hashIndex).assertEqual(33);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0032
     * @tc.name      testPhotosUserFileDataItemInitMatrix0032
     * @tc.desc      Initializes media item matrix sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_31', ['arg_a_31', 'arg_b_31'], 'device_31', 34);
      expect(item.selections).assertEqual('selection_31');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_31');
      expect(item.index).assertEqual(34);
      expect(item.hashIndex).assertEqual(34);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0033
     * @tc.name      testPhotosUserFileDataItemInitMatrix0033
     * @tc.desc      Initializes media item matrix sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_32', ['arg_a_32', 'arg_b_32'], 'device_32', 35);
      expect(item.selections).assertEqual('selection_32');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_32');
      expect(item.index).assertEqual(35);
      expect(item.hashIndex).assertEqual(35);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0034
     * @tc.name      testPhotosUserFileDataItemInitMatrix0034
     * @tc.desc      Initializes media item matrix sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_33', ['arg_a_33', 'arg_b_33'], 'device_33', 36);
      expect(item.selections).assertEqual('selection_33');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_33');
      expect(item.index).assertEqual(36);
      expect(item.hashIndex).assertEqual(36);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0035
     * @tc.name      testPhotosUserFileDataItemInitMatrix0035
     * @tc.desc      Initializes media item matrix sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_34', ['arg_a_34', 'arg_b_34'], 'device_34', 37);
      expect(item.selections).assertEqual('selection_34');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_34');
      expect(item.index).assertEqual(37);
      expect(item.hashIndex).assertEqual(37);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0036
     * @tc.name      testPhotosUserFileDataItemInitMatrix0036
     * @tc.desc      Initializes media item matrix sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_35', ['arg_a_35', 'arg_b_35'], 'device_35', 38);
      expect(item.selections).assertEqual('selection_35');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_35');
      expect(item.index).assertEqual(38);
      expect(item.hashIndex).assertEqual(38);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0037
     * @tc.name      testPhotosUserFileDataItemInitMatrix0037
     * @tc.desc      Initializes media item matrix sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_36', ['arg_a_36', 'arg_b_36'], 'device_36', 39);
      expect(item.selections).assertEqual('selection_36');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_36');
      expect(item.index).assertEqual(39);
      expect(item.hashIndex).assertEqual(39);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0038
     * @tc.name      testPhotosUserFileDataItemInitMatrix0038
     * @tc.desc      Initializes media item matrix sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_37', ['arg_a_37', 'arg_b_37'], 'device_37', 40);
      expect(item.selections).assertEqual('selection_37');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_37');
      expect(item.index).assertEqual(40);
      expect(item.hashIndex).assertEqual(40);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0039
     * @tc.name      testPhotosUserFileDataItemInitMatrix0039
     * @tc.desc      Initializes media item matrix sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_38', ['arg_a_38', 'arg_b_38'], 'device_38', 41);
      expect(item.selections).assertEqual('selection_38');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_38');
      expect(item.index).assertEqual(41);
      expect(item.hashIndex).assertEqual(41);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0040
     * @tc.name      testPhotosUserFileDataItemInitMatrix0040
     * @tc.desc      Initializes media item matrix sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_39', ['arg_a_39', 'arg_b_39'], 'device_39', 42);
      expect(item.selections).assertEqual('selection_39');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_39');
      expect(item.index).assertEqual(42);
      expect(item.hashIndex).assertEqual(42);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0041
     * @tc.name      testPhotosUserFileDataItemInitMatrix0041
     * @tc.desc      Initializes media item matrix sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_40', ['arg_a_40', 'arg_b_40'], 'device_40', 43);
      expect(item.selections).assertEqual('selection_40');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_40');
      expect(item.index).assertEqual(43);
      expect(item.hashIndex).assertEqual(43);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0042
     * @tc.name      testPhotosUserFileDataItemInitMatrix0042
     * @tc.desc      Initializes media item matrix sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_41', ['arg_a_41', 'arg_b_41'], 'device_41', 44);
      expect(item.selections).assertEqual('selection_41');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_41');
      expect(item.index).assertEqual(44);
      expect(item.hashIndex).assertEqual(44);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0043
     * @tc.name      testPhotosUserFileDataItemInitMatrix0043
     * @tc.desc      Initializes media item matrix sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_42', ['arg_a_42', 'arg_b_42'], 'device_42', 45);
      expect(item.selections).assertEqual('selection_42');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_42');
      expect(item.index).assertEqual(45);
      expect(item.hashIndex).assertEqual(45);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0044
     * @tc.name      testPhotosUserFileDataItemInitMatrix0044
     * @tc.desc      Initializes media item matrix sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_43', ['arg_a_43', 'arg_b_43'], 'device_43', 46);
      expect(item.selections).assertEqual('selection_43');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_43');
      expect(item.index).assertEqual(46);
      expect(item.hashIndex).assertEqual(46);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0045
     * @tc.name      testPhotosUserFileDataItemInitMatrix0045
     * @tc.desc      Initializes media item matrix sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_44', ['arg_a_44', 'arg_b_44'], 'device_44', 47);
      expect(item.selections).assertEqual('selection_44');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_44');
      expect(item.index).assertEqual(47);
      expect(item.hashIndex).assertEqual(47);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0046
     * @tc.name      testPhotosUserFileDataItemInitMatrix0046
     * @tc.desc      Initializes media item matrix sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_45', ['arg_a_45', 'arg_b_45'], 'device_45', 48);
      expect(item.selections).assertEqual('selection_45');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_45');
      expect(item.index).assertEqual(48);
      expect(item.hashIndex).assertEqual(48);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0047
     * @tc.name      testPhotosUserFileDataItemInitMatrix0047
     * @tc.desc      Initializes media item matrix sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_46', ['arg_a_46', 'arg_b_46'], 'device_46', 49);
      expect(item.selections).assertEqual('selection_46');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_46');
      expect(item.index).assertEqual(49);
      expect(item.hashIndex).assertEqual(49);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0048
     * @tc.name      testPhotosUserFileDataItemInitMatrix0048
     * @tc.desc      Initializes media item matrix sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_47', ['arg_a_47', 'arg_b_47'], 'device_47', 50);
      expect(item.selections).assertEqual('selection_47');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_47');
      expect(item.index).assertEqual(50);
      expect(item.hashIndex).assertEqual(50);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0049
     * @tc.name      testPhotosUserFileDataItemInitMatrix0049
     * @tc.desc      Initializes media item matrix sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_48', ['arg_a_48', 'arg_b_48'], 'device_48', 51);
      expect(item.selections).assertEqual('selection_48');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_48');
      expect(item.index).assertEqual(51);
      expect(item.hashIndex).assertEqual(51);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0050
     * @tc.name      testPhotosUserFileDataItemInitMatrix0050
     * @tc.desc      Initializes media item matrix sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_49', ['arg_a_49', 'arg_b_49'], 'device_49', 52);
      expect(item.selections).assertEqual('selection_49');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_49');
      expect(item.index).assertEqual(52);
      expect(item.hashIndex).assertEqual(52);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0051
     * @tc.name      testPhotosUserFileDataItemInitMatrix0051
     * @tc.desc      Initializes media item matrix sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_50', ['arg_a_50', 'arg_b_50'], 'device_50', 53);
      expect(item.selections).assertEqual('selection_50');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_50');
      expect(item.index).assertEqual(53);
      expect(item.hashIndex).assertEqual(53);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0052
     * @tc.name      testPhotosUserFileDataItemInitMatrix0052
     * @tc.desc      Initializes media item matrix sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_51', ['arg_a_51', 'arg_b_51'], 'device_51', 54);
      expect(item.selections).assertEqual('selection_51');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_51');
      expect(item.index).assertEqual(54);
      expect(item.hashIndex).assertEqual(54);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0053
     * @tc.name      testPhotosUserFileDataItemInitMatrix0053
     * @tc.desc      Initializes media item matrix sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_52', ['arg_a_52', 'arg_b_52'], 'device_52', 55);
      expect(item.selections).assertEqual('selection_52');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_52');
      expect(item.index).assertEqual(55);
      expect(item.hashIndex).assertEqual(55);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0054
     * @tc.name      testPhotosUserFileDataItemInitMatrix0054
     * @tc.desc      Initializes media item matrix sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_53', ['arg_a_53', 'arg_b_53'], 'device_53', 56);
      expect(item.selections).assertEqual('selection_53');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_53');
      expect(item.index).assertEqual(56);
      expect(item.hashIndex).assertEqual(56);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0055
     * @tc.name      testPhotosUserFileDataItemInitMatrix0055
     * @tc.desc      Initializes media item matrix sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_54', ['arg_a_54', 'arg_b_54'], 'device_54', 57);
      expect(item.selections).assertEqual('selection_54');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_54');
      expect(item.index).assertEqual(57);
      expect(item.hashIndex).assertEqual(57);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0056
     * @tc.name      testPhotosUserFileDataItemInitMatrix0056
     * @tc.desc      Initializes media item matrix sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_55', ['arg_a_55', 'arg_b_55'], 'device_55', 58);
      expect(item.selections).assertEqual('selection_55');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_55');
      expect(item.index).assertEqual(58);
      expect(item.hashIndex).assertEqual(58);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0057
     * @tc.name      testPhotosUserFileDataItemInitMatrix0057
     * @tc.desc      Initializes media item matrix sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_56', ['arg_a_56', 'arg_b_56'], 'device_56', 59);
      expect(item.selections).assertEqual('selection_56');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_56');
      expect(item.index).assertEqual(59);
      expect(item.hashIndex).assertEqual(59);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0058
     * @tc.name      testPhotosUserFileDataItemInitMatrix0058
     * @tc.desc      Initializes media item matrix sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_57', ['arg_a_57', 'arg_b_57'], 'device_57', 60);
      expect(item.selections).assertEqual('selection_57');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_57');
      expect(item.index).assertEqual(60);
      expect(item.hashIndex).assertEqual(60);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0059
     * @tc.name      testPhotosUserFileDataItemInitMatrix0059
     * @tc.desc      Initializes media item matrix sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_58', ['arg_a_58', 'arg_b_58'], 'device_58', 61);
      expect(item.selections).assertEqual('selection_58');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_58');
      expect(item.index).assertEqual(61);
      expect(item.hashIndex).assertEqual(61);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_0060
     * @tc.name      testPhotosUserFileDataItemInitMatrix0060
     * @tc.desc      Initializes media item matrix sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('selection_59', ['arg_a_59', 'arg_b_59'], 'device_59', 62);
      expect(item.selections).assertEqual('selection_59');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device_59');
      expect(item.index).assertEqual(62);
      expect(item.hashIndex).assertEqual(62);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitMatrix0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0001
     * @tc.name      testPhotosUserFileDataItemHashMatrix0001
     * @tc.desc      Builds media item hash matrix sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 1);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/0';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/00 0 true');
      expect(item.getHashCode() === '1').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0002
     * @tc.name      testPhotosUserFileDataItemHashMatrix0002
     * @tc.desc      Builds media item hash matrix sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 2);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/1';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/11 90 false');
      expect(item.getHashCode() === '2').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0003
     * @tc.name      testPhotosUserFileDataItemHashMatrix0003
     * @tc.desc      Builds media item hash matrix sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 3);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/2';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/20 180 false');
      expect(item.getHashCode() === '3').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0004
     * @tc.name      testPhotosUserFileDataItemHashMatrix0004
     * @tc.desc      Builds media item hash matrix sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 4);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/3';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/31 270 true');
      expect(item.getHashCode() === '4').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0005
     * @tc.name      testPhotosUserFileDataItemHashMatrix0005
     * @tc.desc      Builds media item hash matrix sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 5);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/4';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/40 0 false');
      expect(item.getHashCode() === '5').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0006
     * @tc.name      testPhotosUserFileDataItemHashMatrix0006
     * @tc.desc      Builds media item hash matrix sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 6);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/5';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/51 90 false');
      expect(item.getHashCode() === '6').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0007
     * @tc.name      testPhotosUserFileDataItemHashMatrix0007
     * @tc.desc      Builds media item hash matrix sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 7);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/6';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/60 180 true');
      expect(item.getHashCode() === '7').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0008
     * @tc.name      testPhotosUserFileDataItemHashMatrix0008
     * @tc.desc      Builds media item hash matrix sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 8);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/7';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/71 270 false');
      expect(item.getHashCode() === '8').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0009
     * @tc.name      testPhotosUserFileDataItemHashMatrix0009
     * @tc.desc      Builds media item hash matrix sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 9);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/8';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/80 0 false');
      expect(item.getHashCode() === '9').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0010
     * @tc.name      testPhotosUserFileDataItemHashMatrix0010
     * @tc.desc      Builds media item hash matrix sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 10);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/9';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/91 90 true');
      expect(item.getHashCode() === '10').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0011
     * @tc.name      testPhotosUserFileDataItemHashMatrix0011
     * @tc.desc      Builds media item hash matrix sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 11);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/10';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/100 180 false');
      expect(item.getHashCode() === '11').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0012
     * @tc.name      testPhotosUserFileDataItemHashMatrix0012
     * @tc.desc      Builds media item hash matrix sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 12);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/11';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/111 270 false');
      expect(item.getHashCode() === '12').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0013
     * @tc.name      testPhotosUserFileDataItemHashMatrix0013
     * @tc.desc      Builds media item hash matrix sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 13);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/12';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/120 0 true');
      expect(item.getHashCode() === '13').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0014
     * @tc.name      testPhotosUserFileDataItemHashMatrix0014
     * @tc.desc      Builds media item hash matrix sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 14);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/13';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/131 90 false');
      expect(item.getHashCode() === '14').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0015
     * @tc.name      testPhotosUserFileDataItemHashMatrix0015
     * @tc.desc      Builds media item hash matrix sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 15);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/14';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/140 180 false');
      expect(item.getHashCode() === '15').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0016
     * @tc.name      testPhotosUserFileDataItemHashMatrix0016
     * @tc.desc      Builds media item hash matrix sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 16);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/15';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/151 270 true');
      expect(item.getHashCode() === '16').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0017
     * @tc.name      testPhotosUserFileDataItemHashMatrix0017
     * @tc.desc      Builds media item hash matrix sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 17);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/16';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/160 0 false');
      expect(item.getHashCode() === '17').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0018
     * @tc.name      testPhotosUserFileDataItemHashMatrix0018
     * @tc.desc      Builds media item hash matrix sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 18);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/17';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/171 90 false');
      expect(item.getHashCode() === '18').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0019
     * @tc.name      testPhotosUserFileDataItemHashMatrix0019
     * @tc.desc      Builds media item hash matrix sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 19);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/18';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/180 180 true');
      expect(item.getHashCode() === '19').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0020
     * @tc.name      testPhotosUserFileDataItemHashMatrix0020
     * @tc.desc      Builds media item hash matrix sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 20);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/19';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/191 270 false');
      expect(item.getHashCode() === '20').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0021
     * @tc.name      testPhotosUserFileDataItemHashMatrix0021
     * @tc.desc      Builds media item hash matrix sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 21);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/20';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/200 0 false');
      expect(item.getHashCode() === '21').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0022
     * @tc.name      testPhotosUserFileDataItemHashMatrix0022
     * @tc.desc      Builds media item hash matrix sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 22);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/21';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/211 90 true');
      expect(item.getHashCode() === '22').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0023
     * @tc.name      testPhotosUserFileDataItemHashMatrix0023
     * @tc.desc      Builds media item hash matrix sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 23);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/22';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/220 180 false');
      expect(item.getHashCode() === '23').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0024
     * @tc.name      testPhotosUserFileDataItemHashMatrix0024
     * @tc.desc      Builds media item hash matrix sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 24);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/23';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/231 270 false');
      expect(item.getHashCode() === '24').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0025
     * @tc.name      testPhotosUserFileDataItemHashMatrix0025
     * @tc.desc      Builds media item hash matrix sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 25);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/24';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/240 0 true');
      expect(item.getHashCode() === '25').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0026
     * @tc.name      testPhotosUserFileDataItemHashMatrix0026
     * @tc.desc      Builds media item hash matrix sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 26);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/25';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/251 90 false');
      expect(item.getHashCode() === '26').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0027
     * @tc.name      testPhotosUserFileDataItemHashMatrix0027
     * @tc.desc      Builds media item hash matrix sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 27);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/26';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/260 180 false');
      expect(item.getHashCode() === '27').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0028
     * @tc.name      testPhotosUserFileDataItemHashMatrix0028
     * @tc.desc      Builds media item hash matrix sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 28);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/27';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/271 270 true');
      expect(item.getHashCode() === '28').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0029
     * @tc.name      testPhotosUserFileDataItemHashMatrix0029
     * @tc.desc      Builds media item hash matrix sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 29);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/28';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/280 0 false');
      expect(item.getHashCode() === '29').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_0030
     * @tc.name      testPhotosUserFileDataItemHashMatrix0030
     * @tc.desc      Builds media item hash matrix sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 30);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/29';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/291 90 false');
      expect(item.getHashCode() === '30').assertFalse();
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashMatrix0030 end');
    })
  })
}
