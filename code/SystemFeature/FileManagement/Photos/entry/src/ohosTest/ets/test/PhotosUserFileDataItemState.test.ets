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
import { MediaConstants } from '../../../main/ets/constants/MediaConstants';

const TAG = '[Sample_PhotosUserFileDataItemStateTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemStateTest(): void {
  describe('PhotosUserFileDataItemStateTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0001
     * @tc.name      testPhotosUserFileDataItemState0001
     * @tc.desc      Checks media item undefined state sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('301');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0002
     * @tc.name      testPhotosUserFileDataItemState0002
     * @tc.desc      Checks media item partLoaded state sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0003
     * @tc.name      testPhotosUserFileDataItemState0003
     * @tc.desc      Checks media item loaded state sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0004
     * @tc.name      testPhotosUserFileDataItemState0004
     * @tc.desc      Checks media item trashed state sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0005
     * @tc.name      testPhotosUserFileDataItemState0005
     * @tc.desc      Checks media item undefined state sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('302');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0006
     * @tc.name      testPhotosUserFileDataItemState0006
     * @tc.desc      Checks media item partLoaded state sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0007
     * @tc.name      testPhotosUserFileDataItemState0007
     * @tc.desc      Checks media item loaded state sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0008
     * @tc.name      testPhotosUserFileDataItemState0008
     * @tc.desc      Checks media item trashed state sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0009
     * @tc.name      testPhotosUserFileDataItemState0009
     * @tc.desc      Checks media item undefined state sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('303');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0010
     * @tc.name      testPhotosUserFileDataItemState0010
     * @tc.desc      Checks media item partLoaded state sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0011
     * @tc.name      testPhotosUserFileDataItemState0011
     * @tc.desc      Checks media item loaded state sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0012
     * @tc.name      testPhotosUserFileDataItemState0012
     * @tc.desc      Checks media item trashed state sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0013
     * @tc.name      testPhotosUserFileDataItemState0013
     * @tc.desc      Checks media item undefined state sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('304');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0014
     * @tc.name      testPhotosUserFileDataItemState0014
     * @tc.desc      Checks media item partLoaded state sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0015
     * @tc.name      testPhotosUserFileDataItemState0015
     * @tc.desc      Checks media item loaded state sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0016
     * @tc.name      testPhotosUserFileDataItemState0016
     * @tc.desc      Checks media item trashed state sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0017
     * @tc.name      testPhotosUserFileDataItemState0017
     * @tc.desc      Checks media item undefined state sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('305');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0018
     * @tc.name      testPhotosUserFileDataItemState0018
     * @tc.desc      Checks media item partLoaded state sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0019
     * @tc.name      testPhotosUserFileDataItemState0019
     * @tc.desc      Checks media item loaded state sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0020
     * @tc.name      testPhotosUserFileDataItemState0020
     * @tc.desc      Checks media item trashed state sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0021
     * @tc.name      testPhotosUserFileDataItemState0021
     * @tc.desc      Checks media item undefined state sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('306');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0022
     * @tc.name      testPhotosUserFileDataItemState0022
     * @tc.desc      Checks media item partLoaded state sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0023
     * @tc.name      testPhotosUserFileDataItemState0023
     * @tc.desc      Checks media item loaded state sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0024
     * @tc.name      testPhotosUserFileDataItemState0024
     * @tc.desc      Checks media item trashed state sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0025
     * @tc.name      testPhotosUserFileDataItemState0025
     * @tc.desc      Checks media item undefined state sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('307');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0026
     * @tc.name      testPhotosUserFileDataItemState0026
     * @tc.desc      Checks media item partLoaded state sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0027
     * @tc.name      testPhotosUserFileDataItemState0027
     * @tc.desc      Checks media item loaded state sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0028
     * @tc.name      testPhotosUserFileDataItemState0028
     * @tc.desc      Checks media item trashed state sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0029
     * @tc.name      testPhotosUserFileDataItemState0029
     * @tc.desc      Checks media item undefined state sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('308');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0030
     * @tc.name      testPhotosUserFileDataItemState0030
     * @tc.desc      Checks media item partLoaded state sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0031
     * @tc.name      testPhotosUserFileDataItemState0031
     * @tc.desc      Checks media item loaded state sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0032
     * @tc.name      testPhotosUserFileDataItemState0032
     * @tc.desc      Checks media item trashed state sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0033
     * @tc.name      testPhotosUserFileDataItemState0033
     * @tc.desc      Checks media item undefined state sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('309');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0034
     * @tc.name      testPhotosUserFileDataItemState0034
     * @tc.desc      Checks media item partLoaded state sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0035
     * @tc.name      testPhotosUserFileDataItemState0035
     * @tc.desc      Checks media item loaded state sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0036
     * @tc.name      testPhotosUserFileDataItemState0036
     * @tc.desc      Checks media item trashed state sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0037
     * @tc.name      testPhotosUserFileDataItemState0037
     * @tc.desc      Checks media item undefined state sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('310');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0038
     * @tc.name      testPhotosUserFileDataItemState0038
     * @tc.desc      Checks media item partLoaded state sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0039
     * @tc.name      testPhotosUserFileDataItemState0039
     * @tc.desc      Checks media item loaded state sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0040
     * @tc.name      testPhotosUserFileDataItemState0040
     * @tc.desc      Checks media item trashed state sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0041
     * @tc.name      testPhotosUserFileDataItemState0041
     * @tc.desc      Checks media item undefined state sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('311');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0042
     * @tc.name      testPhotosUserFileDataItemState0042
     * @tc.desc      Checks media item partLoaded state sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0043
     * @tc.name      testPhotosUserFileDataItemState0043
     * @tc.desc      Checks media item loaded state sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0044
     * @tc.name      testPhotosUserFileDataItemState0044
     * @tc.desc      Checks media item trashed state sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0045
     * @tc.name      testPhotosUserFileDataItemState0045
     * @tc.desc      Checks media item undefined state sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('312');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0046
     * @tc.name      testPhotosUserFileDataItemState0046
     * @tc.desc      Checks media item partLoaded state sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0047
     * @tc.name      testPhotosUserFileDataItemState0047
     * @tc.desc      Checks media item loaded state sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0048
     * @tc.name      testPhotosUserFileDataItemState0048
     * @tc.desc      Checks media item trashed state sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0049
     * @tc.name      testPhotosUserFileDataItemState0049
     * @tc.desc      Checks media item undefined state sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('313');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0050
     * @tc.name      testPhotosUserFileDataItemState0050
     * @tc.desc      Checks media item partLoaded state sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0051
     * @tc.name      testPhotosUserFileDataItemState0051
     * @tc.desc      Checks media item loaded state sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0052
     * @tc.name      testPhotosUserFileDataItemState0052
     * @tc.desc      Checks media item trashed state sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0053
     * @tc.name      testPhotosUserFileDataItemState0053
     * @tc.desc      Checks media item undefined state sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('314');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0054
     * @tc.name      testPhotosUserFileDataItemState0054
     * @tc.desc      Checks media item partLoaded state sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0055
     * @tc.name      testPhotosUserFileDataItemState0055
     * @tc.desc      Checks media item loaded state sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0056
     * @tc.name      testPhotosUserFileDataItemState0056
     * @tc.desc      Checks media item trashed state sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0057
     * @tc.name      testPhotosUserFileDataItemState0057
     * @tc.desc      Checks media item undefined state sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('315');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0058
     * @tc.name      testPhotosUserFileDataItemState0058
     * @tc.desc      Checks media item partLoaded state sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0059
     * @tc.name      testPhotosUserFileDataItemState0059
     * @tc.desc      Checks media item loaded state sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0060
     * @tc.name      testPhotosUserFileDataItemState0060
     * @tc.desc      Checks media item trashed state sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0061
     * @tc.name      testPhotosUserFileDataItemState0061
     * @tc.desc      Checks media item undefined state sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0061 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('316');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0062
     * @tc.name      testPhotosUserFileDataItemState0062
     * @tc.desc      Checks media item partLoaded state sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0062 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0063
     * @tc.name      testPhotosUserFileDataItemState0063
     * @tc.desc      Checks media item loaded state sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0063 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0064
     * @tc.name      testPhotosUserFileDataItemState0064
     * @tc.desc      Checks media item trashed state sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0064 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0065
     * @tc.name      testPhotosUserFileDataItemState0065
     * @tc.desc      Checks media item undefined state sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0065 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('317');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0066
     * @tc.name      testPhotosUserFileDataItemState0066
     * @tc.desc      Checks media item partLoaded state sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0066 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0067
     * @tc.name      testPhotosUserFileDataItemState0067
     * @tc.desc      Checks media item loaded state sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0067 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0068
     * @tc.name      testPhotosUserFileDataItemState0068
     * @tc.desc      Checks media item trashed state sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0068 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0069
     * @tc.name      testPhotosUserFileDataItemState0069
     * @tc.desc      Checks media item undefined state sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0069 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('318');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0070
     * @tc.name      testPhotosUserFileDataItemState0070
     * @tc.desc      Checks media item partLoaded state sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0070 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0071
     * @tc.name      testPhotosUserFileDataItemState0071
     * @tc.desc      Checks media item loaded state sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0071 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0072
     * @tc.name      testPhotosUserFileDataItemState0072
     * @tc.desc      Checks media item trashed state sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0072 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0073
     * @tc.name      testPhotosUserFileDataItemState0073
     * @tc.desc      Checks media item undefined state sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0073 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('319');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0074
     * @tc.name      testPhotosUserFileDataItemState0074
     * @tc.desc      Checks media item partLoaded state sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0074 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0075
     * @tc.name      testPhotosUserFileDataItemState0075
     * @tc.desc      Checks media item loaded state sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0075 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0076
     * @tc.name      testPhotosUserFileDataItemState0076
     * @tc.desc      Checks media item trashed state sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0076 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0077
     * @tc.name      testPhotosUserFileDataItemState0077
     * @tc.desc      Checks media item undefined state sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0077 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('320');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0078
     * @tc.name      testPhotosUserFileDataItemState0078
     * @tc.desc      Checks media item partLoaded state sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0078 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0079
     * @tc.name      testPhotosUserFileDataItemState0079
     * @tc.desc      Checks media item loaded state sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0079 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0080
     * @tc.name      testPhotosUserFileDataItemState0080
     * @tc.desc      Checks media item trashed state sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0080 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0081
     * @tc.name      testPhotosUserFileDataItemState0081
     * @tc.desc      Checks media item undefined state sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0081 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('321');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0082
     * @tc.name      testPhotosUserFileDataItemState0082
     * @tc.desc      Checks media item partLoaded state sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0082 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0083
     * @tc.name      testPhotosUserFileDataItemState0083
     * @tc.desc      Checks media item loaded state sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0083 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0084
     * @tc.name      testPhotosUserFileDataItemState0084
     * @tc.desc      Checks media item trashed state sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0084 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0085
     * @tc.name      testPhotosUserFileDataItemState0085
     * @tc.desc      Checks media item undefined state sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0085 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('322');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0086
     * @tc.name      testPhotosUserFileDataItemState0086
     * @tc.desc      Checks media item partLoaded state sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0086 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0087
     * @tc.name      testPhotosUserFileDataItemState0087
     * @tc.desc      Checks media item loaded state sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0087 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0088
     * @tc.name      testPhotosUserFileDataItemState0088
     * @tc.desc      Checks media item trashed state sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0088 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0089
     * @tc.name      testPhotosUserFileDataItemState0089
     * @tc.desc      Checks media item undefined state sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0089 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('323');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0090
     * @tc.name      testPhotosUserFileDataItemState0090
     * @tc.desc      Checks media item partLoaded state sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0090 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0091
     * @tc.name      testPhotosUserFileDataItemState0091
     * @tc.desc      Checks media item loaded state sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0091 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0092
     * @tc.name      testPhotosUserFileDataItemState0092
     * @tc.desc      Checks media item trashed state sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0092 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0093
     * @tc.name      testPhotosUserFileDataItemState0093
     * @tc.desc      Checks media item undefined state sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0093 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('324');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0094
     * @tc.name      testPhotosUserFileDataItemState0094
     * @tc.desc      Checks media item partLoaded state sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0094 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0095
     * @tc.name      testPhotosUserFileDataItemState0095
     * @tc.desc      Checks media item loaded state sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0095 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0096
     * @tc.name      testPhotosUserFileDataItemState0096
     * @tc.desc      Checks media item trashed state sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0096 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0097
     * @tc.name      testPhotosUserFileDataItemState0097
     * @tc.desc      Checks media item undefined state sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0097 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('325');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0098
     * @tc.name      testPhotosUserFileDataItemState0098
     * @tc.desc      Checks media item partLoaded state sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0098 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0099
     * @tc.name      testPhotosUserFileDataItemState0099
     * @tc.desc      Checks media item loaded state sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0099 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0100
     * @tc.name      testPhotosUserFileDataItemState0100
     * @tc.desc      Checks media item trashed state sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0100 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0101
     * @tc.name      testPhotosUserFileDataItemState0101
     * @tc.desc      Checks media item undefined state sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0101 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('326');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0102
     * @tc.name      testPhotosUserFileDataItemState0102
     * @tc.desc      Checks media item partLoaded state sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0102 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0103
     * @tc.name      testPhotosUserFileDataItemState0103
     * @tc.desc      Checks media item loaded state sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0103 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0104
     * @tc.name      testPhotosUserFileDataItemState0104
     * @tc.desc      Checks media item trashed state sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0104 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0105
     * @tc.name      testPhotosUserFileDataItemState0105
     * @tc.desc      Checks media item undefined state sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0105 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('327');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0105 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0106
     * @tc.name      testPhotosUserFileDataItemState0106
     * @tc.desc      Checks media item partLoaded state sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0106 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0107
     * @tc.name      testPhotosUserFileDataItemState0107
     * @tc.desc      Checks media item loaded state sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0107 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0108
     * @tc.name      testPhotosUserFileDataItemState0108
     * @tc.desc      Checks media item trashed state sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0108 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0109
     * @tc.name      testPhotosUserFileDataItemState0109
     * @tc.desc      Checks media item undefined state sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0109 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('328');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0110
     * @tc.name      testPhotosUserFileDataItemState0110
     * @tc.desc      Checks media item partLoaded state sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0110 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0111
     * @tc.name      testPhotosUserFileDataItemState0111
     * @tc.desc      Checks media item loaded state sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0111 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0112
     * @tc.name      testPhotosUserFileDataItemState0112
     * @tc.desc      Checks media item trashed state sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0112 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0113
     * @tc.name      testPhotosUserFileDataItemState0113
     * @tc.desc      Checks media item undefined state sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0113 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('329');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0114
     * @tc.name      testPhotosUserFileDataItemState0114
     * @tc.desc      Checks media item partLoaded state sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0114 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0115
     * @tc.name      testPhotosUserFileDataItemState0115
     * @tc.desc      Checks media item loaded state sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0115 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0116
     * @tc.name      testPhotosUserFileDataItemState0116
     * @tc.desc      Checks media item trashed state sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0116 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0117
     * @tc.name      testPhotosUserFileDataItemState0117
     * @tc.desc      Checks media item undefined state sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0117 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('330');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0118
     * @tc.name      testPhotosUserFileDataItemState0118
     * @tc.desc      Checks media item partLoaded state sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0118 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0119
     * @tc.name      testPhotosUserFileDataItemState0119
     * @tc.desc      Checks media item loaded state sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0119 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0120
     * @tc.name      testPhotosUserFileDataItemState0120
     * @tc.desc      Checks media item trashed state sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0120 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0120 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0121
     * @tc.name      testPhotosUserFileDataItemState0121
     * @tc.desc      Checks media item undefined state sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0121 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('331');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0122
     * @tc.name      testPhotosUserFileDataItemState0122
     * @tc.desc      Checks media item partLoaded state sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0122 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0123
     * @tc.name      testPhotosUserFileDataItemState0123
     * @tc.desc      Checks media item loaded state sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0123 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0124
     * @tc.name      testPhotosUserFileDataItemState0124
     * @tc.desc      Checks media item trashed state sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0124 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0125
     * @tc.name      testPhotosUserFileDataItemState0125
     * @tc.desc      Checks media item undefined state sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0125 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('332');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0126
     * @tc.name      testPhotosUserFileDataItemState0126
     * @tc.desc      Checks media item partLoaded state sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0126 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0127
     * @tc.name      testPhotosUserFileDataItemState0127
     * @tc.desc      Checks media item loaded state sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0127 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0128
     * @tc.name      testPhotosUserFileDataItemState0128
     * @tc.desc      Checks media item trashed state sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0128 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0129
     * @tc.name      testPhotosUserFileDataItemState0129
     * @tc.desc      Checks media item undefined state sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0129 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('333');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0130
     * @tc.name      testPhotosUserFileDataItemState0130
     * @tc.desc      Checks media item partLoaded state sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0130 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0131
     * @tc.name      testPhotosUserFileDataItemState0131
     * @tc.desc      Checks media item loaded state sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0131 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0132
     * @tc.name      testPhotosUserFileDataItemState0132
     * @tc.desc      Checks media item trashed state sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0132 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0133
     * @tc.name      testPhotosUserFileDataItemState0133
     * @tc.desc      Checks media item undefined state sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0133 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('334');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0134
     * @tc.name      testPhotosUserFileDataItemState0134
     * @tc.desc      Checks media item partLoaded state sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0134 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0135
     * @tc.name      testPhotosUserFileDataItemState0135
     * @tc.desc      Checks media item loaded state sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0135 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0135 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0136
     * @tc.name      testPhotosUserFileDataItemState0136
     * @tc.desc      Checks media item trashed state sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0136 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0137
     * @tc.name      testPhotosUserFileDataItemState0137
     * @tc.desc      Checks media item undefined state sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0137 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('335');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0138
     * @tc.name      testPhotosUserFileDataItemState0138
     * @tc.desc      Checks media item partLoaded state sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0138 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0139
     * @tc.name      testPhotosUserFileDataItemState0139
     * @tc.desc      Checks media item loaded state sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0139 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0140
     * @tc.name      testPhotosUserFileDataItemState0140
     * @tc.desc      Checks media item trashed state sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0140 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0141
     * @tc.name      testPhotosUserFileDataItemState0141
     * @tc.desc      Checks media item undefined state sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0141 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('336');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0142
     * @tc.name      testPhotosUserFileDataItemState0142
     * @tc.desc      Checks media item partLoaded state sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0142 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0143
     * @tc.name      testPhotosUserFileDataItemState0143
     * @tc.desc      Checks media item loaded state sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0143 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0144
     * @tc.name      testPhotosUserFileDataItemState0144
     * @tc.desc      Checks media item trashed state sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0144 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0145
     * @tc.name      testPhotosUserFileDataItemState0145
     * @tc.desc      Checks media item undefined state sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0145 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('337');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0146
     * @tc.name      testPhotosUserFileDataItemState0146
     * @tc.desc      Checks media item partLoaded state sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0146 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0147
     * @tc.name      testPhotosUserFileDataItemState0147
     * @tc.desc      Checks media item loaded state sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0147 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0148
     * @tc.name      testPhotosUserFileDataItemState0148
     * @tc.desc      Checks media item trashed state sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0148 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0149
     * @tc.name      testPhotosUserFileDataItemState0149
     * @tc.desc      Checks media item undefined state sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0149 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('338');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0150
     * @tc.name      testPhotosUserFileDataItemState0150
     * @tc.desc      Checks media item partLoaded state sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0150 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0150 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0151
     * @tc.name      testPhotosUserFileDataItemState0151
     * @tc.desc      Checks media item loaded state sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0151 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0152
     * @tc.name      testPhotosUserFileDataItemState0152
     * @tc.desc      Checks media item trashed state sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0152 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0153
     * @tc.name      testPhotosUserFileDataItemState0153
     * @tc.desc      Checks media item undefined state sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0153 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('339');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0154
     * @tc.name      testPhotosUserFileDataItemState0154
     * @tc.desc      Checks media item partLoaded state sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0154 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0155
     * @tc.name      testPhotosUserFileDataItemState0155
     * @tc.desc      Checks media item loaded state sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0155 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0156
     * @tc.name      testPhotosUserFileDataItemState0156
     * @tc.desc      Checks media item trashed state sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0156 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0157
     * @tc.name      testPhotosUserFileDataItemState0157
     * @tc.desc      Checks media item undefined state sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0157 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('340');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0158
     * @tc.name      testPhotosUserFileDataItemState0158
     * @tc.desc      Checks media item partLoaded state sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0158 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0159
     * @tc.name      testPhotosUserFileDataItemState0159
     * @tc.desc      Checks media item loaded state sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0159 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0160
     * @tc.name      testPhotosUserFileDataItemState0160
     * @tc.desc      Checks media item trashed state sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0160 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0161
     * @tc.name      testPhotosUserFileDataItemState0161
     * @tc.desc      Checks media item undefined state sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0161 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('341');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0162
     * @tc.name      testPhotosUserFileDataItemState0162
     * @tc.desc      Checks media item partLoaded state sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0162 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0163
     * @tc.name      testPhotosUserFileDataItemState0163
     * @tc.desc      Checks media item loaded state sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0163 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0164
     * @tc.name      testPhotosUserFileDataItemState0164
     * @tc.desc      Checks media item trashed state sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0164 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0165
     * @tc.name      testPhotosUserFileDataItemState0165
     * @tc.desc      Checks media item undefined state sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0165 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('342');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0165 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0166
     * @tc.name      testPhotosUserFileDataItemState0166
     * @tc.desc      Checks media item partLoaded state sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0166 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0167
     * @tc.name      testPhotosUserFileDataItemState0167
     * @tc.desc      Checks media item loaded state sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0167 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0168
     * @tc.name      testPhotosUserFileDataItemState0168
     * @tc.desc      Checks media item trashed state sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0168 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0169
     * @tc.name      testPhotosUserFileDataItemState0169
     * @tc.desc      Checks media item undefined state sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0169 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('343');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0170
     * @tc.name      testPhotosUserFileDataItemState0170
     * @tc.desc      Checks media item partLoaded state sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0170 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0171
     * @tc.name      testPhotosUserFileDataItemState0171
     * @tc.desc      Checks media item loaded state sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0171 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0172
     * @tc.name      testPhotosUserFileDataItemState0172
     * @tc.desc      Checks media item trashed state sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0172 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0173
     * @tc.name      testPhotosUserFileDataItemState0173
     * @tc.desc      Checks media item undefined state sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0173 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('344');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0174
     * @tc.name      testPhotosUserFileDataItemState0174
     * @tc.desc      Checks media item partLoaded state sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0174 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0175
     * @tc.name      testPhotosUserFileDataItemState0175
     * @tc.desc      Checks media item loaded state sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0175 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0176
     * @tc.name      testPhotosUserFileDataItemState0176
     * @tc.desc      Checks media item trashed state sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0176 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0177
     * @tc.name      testPhotosUserFileDataItemState0177
     * @tc.desc      Checks media item undefined state sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0177 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('345');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0178
     * @tc.name      testPhotosUserFileDataItemState0178
     * @tc.desc      Checks media item partLoaded state sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0178 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0179
     * @tc.name      testPhotosUserFileDataItemState0179
     * @tc.desc      Checks media item loaded state sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0179 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0180
     * @tc.name      testPhotosUserFileDataItemState0180
     * @tc.desc      Checks media item trashed state sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0180 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0180 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0181
     * @tc.name      testPhotosUserFileDataItemState0181
     * @tc.desc      Checks media item undefined state sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0181 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('346');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0182
     * @tc.name      testPhotosUserFileDataItemState0182
     * @tc.desc      Checks media item partLoaded state sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0182 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0183
     * @tc.name      testPhotosUserFileDataItemState0183
     * @tc.desc      Checks media item loaded state sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0183 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0184
     * @tc.name      testPhotosUserFileDataItemState0184
     * @tc.desc      Checks media item trashed state sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0184 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0185
     * @tc.name      testPhotosUserFileDataItemState0185
     * @tc.desc      Checks media item undefined state sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0185 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('347');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0186
     * @tc.name      testPhotosUserFileDataItemState0186
     * @tc.desc      Checks media item partLoaded state sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0186 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0187
     * @tc.name      testPhotosUserFileDataItemState0187
     * @tc.desc      Checks media item loaded state sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0187 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0188
     * @tc.name      testPhotosUserFileDataItemState0188
     * @tc.desc      Checks media item trashed state sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0188 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0189
     * @tc.name      testPhotosUserFileDataItemState0189
     * @tc.desc      Checks media item undefined state sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0189 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('348');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0190
     * @tc.name      testPhotosUserFileDataItemState0190
     * @tc.desc      Checks media item partLoaded state sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0190 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0191
     * @tc.name      testPhotosUserFileDataItemState0191
     * @tc.desc      Checks media item loaded state sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0191 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0192
     * @tc.name      testPhotosUserFileDataItemState0192
     * @tc.desc      Checks media item trashed state sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0192 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0192 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0193
     * @tc.name      testPhotosUserFileDataItemState0193
     * @tc.desc      Checks media item undefined state sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0193 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('349');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0194
     * @tc.name      testPhotosUserFileDataItemState0194
     * @tc.desc      Checks media item partLoaded state sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0194 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0195
     * @tc.name      testPhotosUserFileDataItemState0195
     * @tc.desc      Checks media item loaded state sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0195 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0195 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0196
     * @tc.name      testPhotosUserFileDataItemState0196
     * @tc.desc      Checks media item trashed state sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0196 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0197
     * @tc.name      testPhotosUserFileDataItemState0197
     * @tc.desc      Checks media item undefined state sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0197 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('350');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0198
     * @tc.name      testPhotosUserFileDataItemState0198
     * @tc.desc      Checks media item partLoaded state sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0198 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0199
     * @tc.name      testPhotosUserFileDataItemState0199
     * @tc.desc      Checks media item loaded state sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0199 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0200
     * @tc.name      testPhotosUserFileDataItemState0200
     * @tc.desc      Checks media item trashed state sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0200 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0200 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0201
     * @tc.name      testPhotosUserFileDataItemState0201
     * @tc.desc      Checks media item undefined state sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0201 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('351');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0201 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0202
     * @tc.name      testPhotosUserFileDataItemState0202
     * @tc.desc      Checks media item partLoaded state sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0202 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0202 end');
    })

