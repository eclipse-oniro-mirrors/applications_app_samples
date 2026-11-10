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

const TAG = '[Sample_PhotosUserFileDataItemExtTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemExtTest(): void {
  describe('PhotosUserFileDataItemExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0001
     * @tc.name      testPhotosUserFileDataItemInitExt0001
     * @tc.desc      Initializes extended media item sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_0', ['ext_a_0', 'ext_b_0', 'ext_c_0'], 'ext_device_0', 101);
      expect(item.selections).assertEqual('ext_selection_0');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_0');
      expect(item.deviceId).assertEqual('ext_device_0');
      expect(item.index).assertEqual(101);
      expect(item.hashIndex).assertEqual(101);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0002
     * @tc.name      testPhotosUserFileDataItemInitExt0002
     * @tc.desc      Initializes extended media item sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_1', ['ext_a_1', 'ext_b_1', 'ext_c_1'], 'ext_device_1', 102);
      expect(item.selections).assertEqual('ext_selection_1');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_1');
      expect(item.deviceId).assertEqual('ext_device_1');
      expect(item.index).assertEqual(102);
      expect(item.hashIndex).assertEqual(102);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0003
     * @tc.name      testPhotosUserFileDataItemInitExt0003
     * @tc.desc      Initializes extended media item sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_2', ['ext_a_2', 'ext_b_2', 'ext_c_2'], 'ext_device_2', 103);
      expect(item.selections).assertEqual('ext_selection_2');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_2');
      expect(item.deviceId).assertEqual('ext_device_2');
      expect(item.index).assertEqual(103);
      expect(item.hashIndex).assertEqual(103);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0004
     * @tc.name      testPhotosUserFileDataItemInitExt0004
     * @tc.desc      Initializes extended media item sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_3', ['ext_a_3', 'ext_b_3', 'ext_c_3'], 'ext_device_3', 104);
      expect(item.selections).assertEqual('ext_selection_3');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_3');
      expect(item.deviceId).assertEqual('ext_device_3');
      expect(item.index).assertEqual(104);
      expect(item.hashIndex).assertEqual(104);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0005
     * @tc.name      testPhotosUserFileDataItemInitExt0005
     * @tc.desc      Initializes extended media item sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_4', ['ext_a_4', 'ext_b_4', 'ext_c_4'], 'ext_device_4', 105);
      expect(item.selections).assertEqual('ext_selection_4');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_4');
      expect(item.deviceId).assertEqual('ext_device_4');
      expect(item.index).assertEqual(105);
      expect(item.hashIndex).assertEqual(105);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0006
     * @tc.name      testPhotosUserFileDataItemInitExt0006
     * @tc.desc      Initializes extended media item sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_5', ['ext_a_5', 'ext_b_5', 'ext_c_5'], 'ext_device_5', 106);
      expect(item.selections).assertEqual('ext_selection_5');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_5');
      expect(item.deviceId).assertEqual('ext_device_5');
      expect(item.index).assertEqual(106);
      expect(item.hashIndex).assertEqual(106);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0007
     * @tc.name      testPhotosUserFileDataItemInitExt0007
     * @tc.desc      Initializes extended media item sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_6', ['ext_a_6', 'ext_b_6', 'ext_c_6'], 'ext_device_6', 107);
      expect(item.selections).assertEqual('ext_selection_6');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_6');
      expect(item.deviceId).assertEqual('ext_device_6');
      expect(item.index).assertEqual(107);
      expect(item.hashIndex).assertEqual(107);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0008
     * @tc.name      testPhotosUserFileDataItemInitExt0008
     * @tc.desc      Initializes extended media item sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_7', ['ext_a_7', 'ext_b_7', 'ext_c_7'], 'ext_device_7', 108);
      expect(item.selections).assertEqual('ext_selection_7');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_7');
      expect(item.deviceId).assertEqual('ext_device_7');
      expect(item.index).assertEqual(108);
      expect(item.hashIndex).assertEqual(108);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0009
     * @tc.name      testPhotosUserFileDataItemInitExt0009
     * @tc.desc      Initializes extended media item sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_8', ['ext_a_8', 'ext_b_8', 'ext_c_8'], 'ext_device_8', 109);
      expect(item.selections).assertEqual('ext_selection_8');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_8');
      expect(item.deviceId).assertEqual('ext_device_8');
      expect(item.index).assertEqual(109);
      expect(item.hashIndex).assertEqual(109);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0010
     * @tc.name      testPhotosUserFileDataItemInitExt0010
     * @tc.desc      Initializes extended media item sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_9', ['ext_a_9', 'ext_b_9', 'ext_c_9'], 'ext_device_9', 110);
      expect(item.selections).assertEqual('ext_selection_9');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_9');
      expect(item.deviceId).assertEqual('ext_device_9');
      expect(item.index).assertEqual(110);
      expect(item.hashIndex).assertEqual(110);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0011
     * @tc.name      testPhotosUserFileDataItemInitExt0011
     * @tc.desc      Initializes extended media item sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_10', ['ext_a_10', 'ext_b_10', 'ext_c_10'], 'ext_device_10', 111);
      expect(item.selections).assertEqual('ext_selection_10');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_10');
      expect(item.deviceId).assertEqual('ext_device_10');
      expect(item.index).assertEqual(111);
      expect(item.hashIndex).assertEqual(111);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0012
     * @tc.name      testPhotosUserFileDataItemInitExt0012
     * @tc.desc      Initializes extended media item sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_11', ['ext_a_11', 'ext_b_11', 'ext_c_11'], 'ext_device_11', 112);
      expect(item.selections).assertEqual('ext_selection_11');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_11');
      expect(item.deviceId).assertEqual('ext_device_11');
      expect(item.index).assertEqual(112);
      expect(item.hashIndex).assertEqual(112);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0013
     * @tc.name      testPhotosUserFileDataItemInitExt0013
     * @tc.desc      Initializes extended media item sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_12', ['ext_a_12', 'ext_b_12', 'ext_c_12'], 'ext_device_12', 113);
      expect(item.selections).assertEqual('ext_selection_12');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_12');
      expect(item.deviceId).assertEqual('ext_device_12');
      expect(item.index).assertEqual(113);
      expect(item.hashIndex).assertEqual(113);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0014
     * @tc.name      testPhotosUserFileDataItemInitExt0014
     * @tc.desc      Initializes extended media item sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_13', ['ext_a_13', 'ext_b_13', 'ext_c_13'], 'ext_device_13', 114);
      expect(item.selections).assertEqual('ext_selection_13');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_13');
      expect(item.deviceId).assertEqual('ext_device_13');
      expect(item.index).assertEqual(114);
      expect(item.hashIndex).assertEqual(114);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0015
     * @tc.name      testPhotosUserFileDataItemInitExt0015
     * @tc.desc      Initializes extended media item sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_14', ['ext_a_14', 'ext_b_14', 'ext_c_14'], 'ext_device_14', 115);
      expect(item.selections).assertEqual('ext_selection_14');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_14');
      expect(item.deviceId).assertEqual('ext_device_14');
      expect(item.index).assertEqual(115);
      expect(item.hashIndex).assertEqual(115);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0016
     * @tc.name      testPhotosUserFileDataItemInitExt0016
     * @tc.desc      Initializes extended media item sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_15', ['ext_a_15', 'ext_b_15', 'ext_c_15'], 'ext_device_15', 116);
      expect(item.selections).assertEqual('ext_selection_15');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_15');
      expect(item.deviceId).assertEqual('ext_device_15');
      expect(item.index).assertEqual(116);
      expect(item.hashIndex).assertEqual(116);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0017
     * @tc.name      testPhotosUserFileDataItemInitExt0017
     * @tc.desc      Initializes extended media item sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_16', ['ext_a_16', 'ext_b_16', 'ext_c_16'], 'ext_device_16', 117);
      expect(item.selections).assertEqual('ext_selection_16');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_16');
      expect(item.deviceId).assertEqual('ext_device_16');
      expect(item.index).assertEqual(117);
      expect(item.hashIndex).assertEqual(117);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0018
     * @tc.name      testPhotosUserFileDataItemInitExt0018
     * @tc.desc      Initializes extended media item sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_17', ['ext_a_17', 'ext_b_17', 'ext_c_17'], 'ext_device_17', 118);
      expect(item.selections).assertEqual('ext_selection_17');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_17');
      expect(item.deviceId).assertEqual('ext_device_17');
      expect(item.index).assertEqual(118);
      expect(item.hashIndex).assertEqual(118);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0019
     * @tc.name      testPhotosUserFileDataItemInitExt0019
     * @tc.desc      Initializes extended media item sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_18', ['ext_a_18', 'ext_b_18', 'ext_c_18'], 'ext_device_18', 119);
      expect(item.selections).assertEqual('ext_selection_18');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_18');
      expect(item.deviceId).assertEqual('ext_device_18');
      expect(item.index).assertEqual(119);
      expect(item.hashIndex).assertEqual(119);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0020
     * @tc.name      testPhotosUserFileDataItemInitExt0020
     * @tc.desc      Initializes extended media item sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_19', ['ext_a_19', 'ext_b_19', 'ext_c_19'], 'ext_device_19', 120);
      expect(item.selections).assertEqual('ext_selection_19');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_19');
      expect(item.deviceId).assertEqual('ext_device_19');
      expect(item.index).assertEqual(120);
      expect(item.hashIndex).assertEqual(120);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0021
     * @tc.name      testPhotosUserFileDataItemInitExt0021
     * @tc.desc      Initializes extended media item sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_20', ['ext_a_20', 'ext_b_20', 'ext_c_20'], 'ext_device_20', 121);
      expect(item.selections).assertEqual('ext_selection_20');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_20');
      expect(item.deviceId).assertEqual('ext_device_20');
      expect(item.index).assertEqual(121);
      expect(item.hashIndex).assertEqual(121);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0022
     * @tc.name      testPhotosUserFileDataItemInitExt0022
     * @tc.desc      Initializes extended media item sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_21', ['ext_a_21', 'ext_b_21', 'ext_c_21'], 'ext_device_21', 122);
      expect(item.selections).assertEqual('ext_selection_21');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_21');
      expect(item.deviceId).assertEqual('ext_device_21');
      expect(item.index).assertEqual(122);
      expect(item.hashIndex).assertEqual(122);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0023
     * @tc.name      testPhotosUserFileDataItemInitExt0023
     * @tc.desc      Initializes extended media item sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_22', ['ext_a_22', 'ext_b_22', 'ext_c_22'], 'ext_device_22', 123);
      expect(item.selections).assertEqual('ext_selection_22');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_22');
      expect(item.deviceId).assertEqual('ext_device_22');
      expect(item.index).assertEqual(123);
      expect(item.hashIndex).assertEqual(123);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0024
     * @tc.name      testPhotosUserFileDataItemInitExt0024
     * @tc.desc      Initializes extended media item sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_23', ['ext_a_23', 'ext_b_23', 'ext_c_23'], 'ext_device_23', 124);
      expect(item.selections).assertEqual('ext_selection_23');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_23');
      expect(item.deviceId).assertEqual('ext_device_23');
      expect(item.index).assertEqual(124);
      expect(item.hashIndex).assertEqual(124);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0025
     * @tc.name      testPhotosUserFileDataItemInitExt0025
     * @tc.desc      Initializes extended media item sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_24', ['ext_a_24', 'ext_b_24', 'ext_c_24'], 'ext_device_24', 125);
      expect(item.selections).assertEqual('ext_selection_24');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_24');
      expect(item.deviceId).assertEqual('ext_device_24');
      expect(item.index).assertEqual(125);
      expect(item.hashIndex).assertEqual(125);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0026
     * @tc.name      testPhotosUserFileDataItemInitExt0026
     * @tc.desc      Initializes extended media item sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_25', ['ext_a_25', 'ext_b_25', 'ext_c_25'], 'ext_device_25', 126);
      expect(item.selections).assertEqual('ext_selection_25');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_25');
      expect(item.deviceId).assertEqual('ext_device_25');
      expect(item.index).assertEqual(126);
      expect(item.hashIndex).assertEqual(126);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0027
     * @tc.name      testPhotosUserFileDataItemInitExt0027
     * @tc.desc      Initializes extended media item sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_26', ['ext_a_26', 'ext_b_26', 'ext_c_26'], 'ext_device_26', 127);
      expect(item.selections).assertEqual('ext_selection_26');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_26');
      expect(item.deviceId).assertEqual('ext_device_26');
      expect(item.index).assertEqual(127);
      expect(item.hashIndex).assertEqual(127);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0028
     * @tc.name      testPhotosUserFileDataItemInitExt0028
     * @tc.desc      Initializes extended media item sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_27', ['ext_a_27', 'ext_b_27', 'ext_c_27'], 'ext_device_27', 128);
      expect(item.selections).assertEqual('ext_selection_27');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_27');
      expect(item.deviceId).assertEqual('ext_device_27');
      expect(item.index).assertEqual(128);
      expect(item.hashIndex).assertEqual(128);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0029
     * @tc.name      testPhotosUserFileDataItemInitExt0029
     * @tc.desc      Initializes extended media item sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_28', ['ext_a_28', 'ext_b_28', 'ext_c_28'], 'ext_device_28', 129);
      expect(item.selections).assertEqual('ext_selection_28');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_28');
      expect(item.deviceId).assertEqual('ext_device_28');
      expect(item.index).assertEqual(129);
      expect(item.hashIndex).assertEqual(129);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0030
     * @tc.name      testPhotosUserFileDataItemInitExt0030
     * @tc.desc      Initializes extended media item sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_29', ['ext_a_29', 'ext_b_29', 'ext_c_29'], 'ext_device_29', 130);
      expect(item.selections).assertEqual('ext_selection_29');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_29');
      expect(item.deviceId).assertEqual('ext_device_29');
      expect(item.index).assertEqual(130);
      expect(item.hashIndex).assertEqual(130);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0031
     * @tc.name      testPhotosUserFileDataItemInitExt0031
     * @tc.desc      Initializes extended media item sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_30', ['ext_a_30', 'ext_b_30', 'ext_c_30'], 'ext_device_30', 131);
      expect(item.selections).assertEqual('ext_selection_30');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_30');
      expect(item.deviceId).assertEqual('ext_device_30');
      expect(item.index).assertEqual(131);
      expect(item.hashIndex).assertEqual(131);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0032
     * @tc.name      testPhotosUserFileDataItemInitExt0032
     * @tc.desc      Initializes extended media item sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_31', ['ext_a_31', 'ext_b_31', 'ext_c_31'], 'ext_device_31', 132);
      expect(item.selections).assertEqual('ext_selection_31');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_31');
      expect(item.deviceId).assertEqual('ext_device_31');
      expect(item.index).assertEqual(132);
      expect(item.hashIndex).assertEqual(132);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0033
     * @tc.name      testPhotosUserFileDataItemInitExt0033
     * @tc.desc      Initializes extended media item sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_32', ['ext_a_32', 'ext_b_32', 'ext_c_32'], 'ext_device_32', 133);
      expect(item.selections).assertEqual('ext_selection_32');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_32');
      expect(item.deviceId).assertEqual('ext_device_32');
      expect(item.index).assertEqual(133);
      expect(item.hashIndex).assertEqual(133);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0034
     * @tc.name      testPhotosUserFileDataItemInitExt0034
     * @tc.desc      Initializes extended media item sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_33', ['ext_a_33', 'ext_b_33', 'ext_c_33'], 'ext_device_33', 134);
      expect(item.selections).assertEqual('ext_selection_33');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_33');
      expect(item.deviceId).assertEqual('ext_device_33');
      expect(item.index).assertEqual(134);
      expect(item.hashIndex).assertEqual(134);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0035
     * @tc.name      testPhotosUserFileDataItemInitExt0035
     * @tc.desc      Initializes extended media item sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_34', ['ext_a_34', 'ext_b_34', 'ext_c_34'], 'ext_device_34', 135);
      expect(item.selections).assertEqual('ext_selection_34');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_34');
      expect(item.deviceId).assertEqual('ext_device_34');
      expect(item.index).assertEqual(135);
      expect(item.hashIndex).assertEqual(135);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0036
     * @tc.name      testPhotosUserFileDataItemInitExt0036
     * @tc.desc      Initializes extended media item sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_35', ['ext_a_35', 'ext_b_35', 'ext_c_35'], 'ext_device_35', 136);
      expect(item.selections).assertEqual('ext_selection_35');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_35');
      expect(item.deviceId).assertEqual('ext_device_35');
      expect(item.index).assertEqual(136);
      expect(item.hashIndex).assertEqual(136);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0037
     * @tc.name      testPhotosUserFileDataItemInitExt0037
     * @tc.desc      Initializes extended media item sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_36', ['ext_a_36', 'ext_b_36', 'ext_c_36'], 'ext_device_36', 137);
      expect(item.selections).assertEqual('ext_selection_36');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_36');
      expect(item.deviceId).assertEqual('ext_device_36');
      expect(item.index).assertEqual(137);
      expect(item.hashIndex).assertEqual(137);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0038
     * @tc.name      testPhotosUserFileDataItemInitExt0038
     * @tc.desc      Initializes extended media item sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_37', ['ext_a_37', 'ext_b_37', 'ext_c_37'], 'ext_device_37', 138);
      expect(item.selections).assertEqual('ext_selection_37');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_37');
      expect(item.deviceId).assertEqual('ext_device_37');
      expect(item.index).assertEqual(138);
      expect(item.hashIndex).assertEqual(138);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0039
     * @tc.name      testPhotosUserFileDataItemInitExt0039
     * @tc.desc      Initializes extended media item sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_38', ['ext_a_38', 'ext_b_38', 'ext_c_38'], 'ext_device_38', 139);
      expect(item.selections).assertEqual('ext_selection_38');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_38');
      expect(item.deviceId).assertEqual('ext_device_38');
      expect(item.index).assertEqual(139);
      expect(item.hashIndex).assertEqual(139);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0040
     * @tc.name      testPhotosUserFileDataItemInitExt0040
     * @tc.desc      Initializes extended media item sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_39', ['ext_a_39', 'ext_b_39', 'ext_c_39'], 'ext_device_39', 140);
      expect(item.selections).assertEqual('ext_selection_39');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_39');
      expect(item.deviceId).assertEqual('ext_device_39');
      expect(item.index).assertEqual(140);
      expect(item.hashIndex).assertEqual(140);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0041
     * @tc.name      testPhotosUserFileDataItemInitExt0041
     * @tc.desc      Initializes extended media item sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_40', ['ext_a_40', 'ext_b_40', 'ext_c_40'], 'ext_device_40', 141);
      expect(item.selections).assertEqual('ext_selection_40');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_40');
      expect(item.deviceId).assertEqual('ext_device_40');
      expect(item.index).assertEqual(141);
      expect(item.hashIndex).assertEqual(141);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0042
     * @tc.name      testPhotosUserFileDataItemInitExt0042
     * @tc.desc      Initializes extended media item sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_41', ['ext_a_41', 'ext_b_41', 'ext_c_41'], 'ext_device_41', 142);
      expect(item.selections).assertEqual('ext_selection_41');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_41');
      expect(item.deviceId).assertEqual('ext_device_41');
      expect(item.index).assertEqual(142);
      expect(item.hashIndex).assertEqual(142);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0043
     * @tc.name      testPhotosUserFileDataItemInitExt0043
     * @tc.desc      Initializes extended media item sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_42', ['ext_a_42', 'ext_b_42', 'ext_c_42'], 'ext_device_42', 143);
      expect(item.selections).assertEqual('ext_selection_42');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_42');
      expect(item.deviceId).assertEqual('ext_device_42');
      expect(item.index).assertEqual(143);
      expect(item.hashIndex).assertEqual(143);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0044
     * @tc.name      testPhotosUserFileDataItemInitExt0044
     * @tc.desc      Initializes extended media item sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_43', ['ext_a_43', 'ext_b_43', 'ext_c_43'], 'ext_device_43', 144);
      expect(item.selections).assertEqual('ext_selection_43');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_43');
      expect(item.deviceId).assertEqual('ext_device_43');
      expect(item.index).assertEqual(144);
      expect(item.hashIndex).assertEqual(144);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0045
     * @tc.name      testPhotosUserFileDataItemInitExt0045
     * @tc.desc      Initializes extended media item sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_44', ['ext_a_44', 'ext_b_44', 'ext_c_44'], 'ext_device_44', 145);
      expect(item.selections).assertEqual('ext_selection_44');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_44');
      expect(item.deviceId).assertEqual('ext_device_44');
      expect(item.index).assertEqual(145);
      expect(item.hashIndex).assertEqual(145);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0046
     * @tc.name      testPhotosUserFileDataItemInitExt0046
     * @tc.desc      Initializes extended media item sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_45', ['ext_a_45', 'ext_b_45', 'ext_c_45'], 'ext_device_45', 146);
      expect(item.selections).assertEqual('ext_selection_45');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_45');
      expect(item.deviceId).assertEqual('ext_device_45');
      expect(item.index).assertEqual(146);
      expect(item.hashIndex).assertEqual(146);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0047
     * @tc.name      testPhotosUserFileDataItemInitExt0047
     * @tc.desc      Initializes extended media item sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_46', ['ext_a_46', 'ext_b_46', 'ext_c_46'], 'ext_device_46', 147);
      expect(item.selections).assertEqual('ext_selection_46');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_46');
      expect(item.deviceId).assertEqual('ext_device_46');
      expect(item.index).assertEqual(147);
      expect(item.hashIndex).assertEqual(147);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0048
     * @tc.name      testPhotosUserFileDataItemInitExt0048
     * @tc.desc      Initializes extended media item sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_47', ['ext_a_47', 'ext_b_47', 'ext_c_47'], 'ext_device_47', 148);
      expect(item.selections).assertEqual('ext_selection_47');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_47');
      expect(item.deviceId).assertEqual('ext_device_47');
      expect(item.index).assertEqual(148);
      expect(item.hashIndex).assertEqual(148);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0049
     * @tc.name      testPhotosUserFileDataItemInitExt0049
     * @tc.desc      Initializes extended media item sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_48', ['ext_a_48', 'ext_b_48', 'ext_c_48'], 'ext_device_48', 149);
      expect(item.selections).assertEqual('ext_selection_48');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_48');
      expect(item.deviceId).assertEqual('ext_device_48');
      expect(item.index).assertEqual(149);
      expect(item.hashIndex).assertEqual(149);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_INIT_EXT_0050
     * @tc.name      testPhotosUserFileDataItemInitExt0050
     * @tc.desc      Initializes extended media item sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInitExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('ext_selection_49', ['ext_a_49', 'ext_b_49', 'ext_c_49'], 'ext_device_49', 150);
      expect(item.selections).assertEqual('ext_selection_49');
      expect(item.selectionArgs.length).assertEqual(3);
      expect(item.selectionArgs[0]).assertEqual('ext_a_49');
      expect(item.deviceId).assertEqual('ext_device_49');
      expect(item.index).assertEqual(150);
      expect(item.hashIndex).assertEqual(150);
      expect(item.path).assertEqual('');
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInitExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0001
     * @tc.name      testPhotosUserFileDataItemHashExt0001
     * @tc.desc      Builds extended media item hash sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_0', 201);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/0';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/01 180 true');
      expect(item.getHashCode() === '201').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_0');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0002
     * @tc.name      testPhotosUserFileDataItemHashExt0002
     * @tc.desc      Builds extended media item hash sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_1', 202);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/1';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/10 270 false');
      expect(item.getHashCode() === '202').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_1');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0003
     * @tc.name      testPhotosUserFileDataItemHashExt0003
     * @tc.desc      Builds extended media item hash sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_2', 203);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/2';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/21 0 true');
      expect(item.getHashCode() === '203').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_2');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0004
     * @tc.name      testPhotosUserFileDataItemHashExt0004
     * @tc.desc      Builds extended media item hash sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_3', 204);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/3';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/30 90 false');
      expect(item.getHashCode() === '204').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_3');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0005
     * @tc.name      testPhotosUserFileDataItemHashExt0005
     * @tc.desc      Builds extended media item hash sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_4', 205);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/4';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/41 180 true');
      expect(item.getHashCode() === '205').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_4');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0006
     * @tc.name      testPhotosUserFileDataItemHashExt0006
     * @tc.desc      Builds extended media item hash sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_5', 206);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/5';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/50 270 false');
      expect(item.getHashCode() === '206').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_5');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0007
     * @tc.name      testPhotosUserFileDataItemHashExt0007
     * @tc.desc      Builds extended media item hash sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_6', 207);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/6';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/61 0 true');
      expect(item.getHashCode() === '207').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_6');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0008
     * @tc.name      testPhotosUserFileDataItemHashExt0008
     * @tc.desc      Builds extended media item hash sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_7', 208);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/7';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/70 90 false');
      expect(item.getHashCode() === '208').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_7');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0009
     * @tc.name      testPhotosUserFileDataItemHashExt0009
     * @tc.desc      Builds extended media item hash sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_8', 209);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/8';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/81 180 true');
      expect(item.getHashCode() === '209').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_8');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0010
     * @tc.name      testPhotosUserFileDataItemHashExt0010
     * @tc.desc      Builds extended media item hash sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_9', 210);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/9';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/90 270 false');
      expect(item.getHashCode() === '210').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_9');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0011
     * @tc.name      testPhotosUserFileDataItemHashExt0011
     * @tc.desc      Builds extended media item hash sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_10', 211);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/10';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/ext/101 0 true');
      expect(item.getHashCode() === '211').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_EXT_0012
     * @tc.name      testPhotosUserFileDataItemHashExt0012
     * @tc.desc      Builds extended media item hash sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'ext_device_11', 212);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/ext/11';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/ext/110 90 false');
      expect(item.getHashCode() === '212').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('ext_device_11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashExt0012 end');
    })

    /**
