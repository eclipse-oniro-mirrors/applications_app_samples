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
