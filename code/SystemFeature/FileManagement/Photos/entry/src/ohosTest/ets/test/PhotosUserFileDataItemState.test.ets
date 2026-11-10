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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_0', ['state_arg_0'], 'state_device_0', 301);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('302');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_1', ['state_arg_1'], 'state_device_1', 302);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('303');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_2', ['state_arg_2'], 'state_device_2', 303);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0012 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('304');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0013 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0014 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0015 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_3', ['state_arg_3'], 'state_device_3', 304);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0016 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0017 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0018 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0019 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_4', ['state_arg_4'], 'state_device_4', 305);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0020 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('306');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0021 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0022 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0023 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_5', ['state_arg_5'], 'state_device_5', 306);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0024 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('307');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0025 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0026 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0027 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_6', ['state_arg_6'], 'state_device_6', 307);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0028 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('308');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0029 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0030 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0031 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_7', ['state_arg_7'], 'state_device_7', 308);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0032 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('309');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0033 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0034 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0035 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_8', ['state_arg_8'], 'state_device_8', 309);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0036 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0037 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0038 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0039 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_9', ['state_arg_9'], 'state_device_9', 310);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0040 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('311');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0041 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0042 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0043 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_10', ['state_arg_10'], 'state_device_10', 311);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0044 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('312');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0045 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0046 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0047 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_11', ['state_arg_11'], 'state_device_11', 312);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0048 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('313');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0049 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0050 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0051 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_12', ['state_arg_12'], 'state_device_12', 313);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0052 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('314');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0053 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0054 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0055 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_13', ['state_arg_13'], 'state_device_13', 314);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0056 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0057 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0058 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0059 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_14', ['state_arg_14'], 'state_device_14', 315);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0060 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0061 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('316');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0061 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0062 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0062 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0063 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0063 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0064 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_15', ['state_arg_15'], 'state_device_15', 316);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0064 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0065 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('317');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0065 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0066 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0066 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0067 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0067 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0068 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_16', ['state_arg_16'], 'state_device_16', 317);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0068 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0069 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('318');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0069 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0070 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0070 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0071 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0071 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0072 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_17', ['state_arg_17'], 'state_device_17', 318);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0072 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0073 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('319');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0073 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0074 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0074 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0075 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0075 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0076 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_18', ['state_arg_18'], 'state_device_18', 319);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0076 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0077 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('320');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0077 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0078 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0078 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0079 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0079 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0080 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_19', ['state_arg_19'], 'state_device_19', 320);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0080 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0081 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('321');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0081 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0082 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0082 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0083 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0083 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0084 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_20', ['state_arg_20'], 'state_device_20', 321);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0084 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0085 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('322');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0085 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0086 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0086 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0087 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0087 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0088 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_21', ['state_arg_21'], 'state_device_21', 322);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0088 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0089 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('323');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0089 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0090 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0090 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0091 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0091 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0092 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_22', ['state_arg_22'], 'state_device_22', 323);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0092 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0093 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('324');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0093 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0094 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0094 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0095 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0095 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0096 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_23', ['state_arg_23'], 'state_device_23', 324);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0096 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0097 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('325');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0097 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0098 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0098 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0099 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0099 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0100 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_24', ['state_arg_24'], 'state_device_24', 325);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0100 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0101 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('326');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0101 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0102 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0102 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0103 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0103 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0104 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_25', ['state_arg_25'], 'state_device_25', 326);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0104 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0105 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('327');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0105 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0106 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0106 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0107 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0107 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0108 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_26', ['state_arg_26'], 'state_device_26', 327);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0108 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0109 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('328');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0109 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0110 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0110 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0111 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0111 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0112 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_27', ['state_arg_27'], 'state_device_27', 328);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0112 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0113 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('329');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0113 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0114 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0114 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0115 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0115 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0116 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_28', ['state_arg_28'], 'state_device_28', 329);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0116 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0117 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0117 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0118 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0118 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0119 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0119 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0120 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_29', ['state_arg_29'], 'state_device_29', 330);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0120 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0121 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0121 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0122 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0122 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0123 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0123 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0124 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_30', ['state_arg_30'], 'state_device_30', 331);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0124 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0125 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('332');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0125 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0126 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0126 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0127 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0127 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0128 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_31', ['state_arg_31'], 'state_device_31', 332);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0128 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0129 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('333');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0129 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0130 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0130 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0131 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0131 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0132 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_32', ['state_arg_32'], 'state_device_32', 333);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0132 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0133 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('334');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0133 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0134 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0134 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0135 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0135 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0136 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_33', ['state_arg_33'], 'state_device_33', 334);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0136 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0137 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('335');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0137 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0138 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0138 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0139 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0139 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0140 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_34', ['state_arg_34'], 'state_device_34', 335);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0140 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0141 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('336');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0141 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0142 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0142 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0143 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0143 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0144 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_35', ['state_arg_35'], 'state_device_35', 336);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0144 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0145 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('337');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0145 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0146 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0146 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0147 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0147 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0148 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_36', ['state_arg_36'], 'state_device_36', 337);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0148 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0149 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('338');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0149 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0150 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0150 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0151 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0151 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0152 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_37', ['state_arg_37'], 'state_device_37', 338);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0152 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0153 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('339');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0153 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0154 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0154 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0155 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0155 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0156 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_38', ['state_arg_38'], 'state_device_38', 339);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0156 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0157 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('340');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0157 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0158 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0158 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0159 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0159 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0160 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_39', ['state_arg_39'], 'state_device_39', 340);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0160 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0161 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('341');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0161 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0162 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0162 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0163 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0163 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0164 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_40', ['state_arg_40'], 'state_device_40', 341);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0164 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0165 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('342');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0165 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0166 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0166 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0167 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0167 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0168 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_41', ['state_arg_41'], 'state_device_41', 342);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0168 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0169 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('343');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0169 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0170 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0170 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0171 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0171 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0172 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_42', ['state_arg_42'], 'state_device_42', 343);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0172 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0173 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('344');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0173 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0174 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0174 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0175 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0175 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0176 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_43', ['state_arg_43'], 'state_device_43', 344);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0176 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0177 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('345');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0177 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0178 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0178 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0179 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0179 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0180 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_44', ['state_arg_44'], 'state_device_44', 345);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0180 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0181 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('346');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0181 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0182 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0182 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0183 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0183 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0184 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_45', ['state_arg_45'], 'state_device_45', 346);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0184 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0185 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('347');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0185 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0186 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0186 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0187 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0187 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0188 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_46', ['state_arg_46'], 'state_device_46', 347);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0188 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0189 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('348');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0189 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0190 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0190 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0191 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0191 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0192 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_47', ['state_arg_47'], 'state_device_47', 348);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0192 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0193 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('349');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0193 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0194 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0194 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0195 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0195 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0196 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_48', ['state_arg_48'], 'state_device_48', 349);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0196 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0197 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('350');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0197 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0198 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0198 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0199 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0199 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0200 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_49', ['state_arg_49'], 'state_device_49', 350);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0200 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0201 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('351');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0201 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0202 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0203
     * @tc.name      testPhotosUserFileDataItemState0203
     * @tc.desc      Checks media item loaded state sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0203 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0204
     * @tc.name      testPhotosUserFileDataItemState0204
     * @tc.desc      Checks media item trashed state sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0204 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_50', ['state_arg_50'], 'state_device_50', 351);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0204 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0205
     * @tc.name      testPhotosUserFileDataItemState0205
     * @tc.desc      Checks media item undefined state sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0205 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_51', ['state_arg_51'], 'state_device_51', 352);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('352');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0205 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0206
     * @tc.name      testPhotosUserFileDataItemState0206
     * @tc.desc      Checks media item partLoaded state sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0206 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_51', ['state_arg_51'], 'state_device_51', 352);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0207
     * @tc.name      testPhotosUserFileDataItemState0207
     * @tc.desc      Checks media item loaded state sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0207 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_51', ['state_arg_51'], 'state_device_51', 352);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0207 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0208
     * @tc.name      testPhotosUserFileDataItemState0208
     * @tc.desc      Checks media item trashed state sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0208 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_51', ['state_arg_51'], 'state_device_51', 352);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0209
     * @tc.name      testPhotosUserFileDataItemState0209
     * @tc.desc      Checks media item undefined state sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0209 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_52', ['state_arg_52'], 'state_device_52', 353);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('353');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0210
     * @tc.name      testPhotosUserFileDataItemState0210
     * @tc.desc      Checks media item partLoaded state sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0210 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_52', ['state_arg_52'], 'state_device_52', 353);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0210 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0211
     * @tc.name      testPhotosUserFileDataItemState0211
     * @tc.desc      Checks media item loaded state sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0211 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_52', ['state_arg_52'], 'state_device_52', 353);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0212
     * @tc.name      testPhotosUserFileDataItemState0212
     * @tc.desc      Checks media item trashed state sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0212 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_52', ['state_arg_52'], 'state_device_52', 353);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0213
     * @tc.name      testPhotosUserFileDataItemState0213
     * @tc.desc      Checks media item undefined state sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0213 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_53', ['state_arg_53'], 'state_device_53', 354);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('354');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0213 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0214
     * @tc.name      testPhotosUserFileDataItemState0214
     * @tc.desc      Checks media item partLoaded state sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0214 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_53', ['state_arg_53'], 'state_device_53', 354);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0215
     * @tc.name      testPhotosUserFileDataItemState0215
     * @tc.desc      Checks media item loaded state sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0215 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_53', ['state_arg_53'], 'state_device_53', 354);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0215 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0216
     * @tc.name      testPhotosUserFileDataItemState0216
     * @tc.desc      Checks media item trashed state sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0216 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_53', ['state_arg_53'], 'state_device_53', 354);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0216 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0217
     * @tc.name      testPhotosUserFileDataItemState0217
     * @tc.desc      Checks media item undefined state sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0217 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_54', ['state_arg_54'], 'state_device_54', 355);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('355');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0218
     * @tc.name      testPhotosUserFileDataItemState0218
     * @tc.desc      Checks media item partLoaded state sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0218 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_54', ['state_arg_54'], 'state_device_54', 355);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0219
     * @tc.name      testPhotosUserFileDataItemState0219
     * @tc.desc      Checks media item loaded state sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0219 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_54', ['state_arg_54'], 'state_device_54', 355);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0219 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0220
     * @tc.name      testPhotosUserFileDataItemState0220
     * @tc.desc      Checks media item trashed state sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0220 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_54', ['state_arg_54'], 'state_device_54', 355);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0220 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0221
     * @tc.name      testPhotosUserFileDataItemState0221
     * @tc.desc      Checks media item undefined state sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0221 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_55', ['state_arg_55'], 'state_device_55', 356);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('356');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0222
     * @tc.name      testPhotosUserFileDataItemState0222
     * @tc.desc      Checks media item partLoaded state sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0222 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_55', ['state_arg_55'], 'state_device_55', 356);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0222 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0223
     * @tc.name      testPhotosUserFileDataItemState0223
     * @tc.desc      Checks media item loaded state sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0223 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_55', ['state_arg_55'], 'state_device_55', 356);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0224
     * @tc.name      testPhotosUserFileDataItemState0224
     * @tc.desc      Checks media item trashed state sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0224 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_55', ['state_arg_55'], 'state_device_55', 356);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0225
     * @tc.name      testPhotosUserFileDataItemState0225
     * @tc.desc      Checks media item undefined state sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0225 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_56', ['state_arg_56'], 'state_device_56', 357);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('357');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0225 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0226
     * @tc.name      testPhotosUserFileDataItemState0226
     * @tc.desc      Checks media item partLoaded state sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0226 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_56', ['state_arg_56'], 'state_device_56', 357);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0227
     * @tc.name      testPhotosUserFileDataItemState0227
     * @tc.desc      Checks media item loaded state sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0227 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_56', ['state_arg_56'], 'state_device_56', 357);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0228
     * @tc.name      testPhotosUserFileDataItemState0228
     * @tc.desc      Checks media item trashed state sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0228 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_56', ['state_arg_56'], 'state_device_56', 357);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0228 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0229
     * @tc.name      testPhotosUserFileDataItemState0229
     * @tc.desc      Checks media item undefined state sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0229 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_57', ['state_arg_57'], 'state_device_57', 358);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('358');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0230
     * @tc.name      testPhotosUserFileDataItemState0230
     * @tc.desc      Checks media item partLoaded state sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0230 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_57', ['state_arg_57'], 'state_device_57', 358);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0230 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0231
     * @tc.name      testPhotosUserFileDataItemState0231
     * @tc.desc      Checks media item loaded state sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0231 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_57', ['state_arg_57'], 'state_device_57', 358);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0231 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0232
     * @tc.name      testPhotosUserFileDataItemState0232
     * @tc.desc      Checks media item trashed state sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0232 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_57', ['state_arg_57'], 'state_device_57', 358);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0233
     * @tc.name      testPhotosUserFileDataItemState0233
     * @tc.desc      Checks media item undefined state sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0233 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_58', ['state_arg_58'], 'state_device_58', 359);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('359');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0234
     * @tc.name      testPhotosUserFileDataItemState0234
     * @tc.desc      Checks media item partLoaded state sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0234 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_58', ['state_arg_58'], 'state_device_58', 359);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0234 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0235
     * @tc.name      testPhotosUserFileDataItemState0235
     * @tc.desc      Checks media item loaded state sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0235 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_58', ['state_arg_58'], 'state_device_58', 359);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0235 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0236
     * @tc.name      testPhotosUserFileDataItemState0236
     * @tc.desc      Checks media item trashed state sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0236 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_58', ['state_arg_58'], 'state_device_58', 359);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0237
     * @tc.name      testPhotosUserFileDataItemState0237
     * @tc.desc      Checks media item undefined state sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0237 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_59', ['state_arg_59'], 'state_device_59', 360);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('360');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0237 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0238
     * @tc.name      testPhotosUserFileDataItemState0238
     * @tc.desc      Checks media item partLoaded state sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0238 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_59', ['state_arg_59'], 'state_device_59', 360);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0239
     * @tc.name      testPhotosUserFileDataItemState0239
     * @tc.desc      Checks media item loaded state sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0239 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_59', ['state_arg_59'], 'state_device_59', 360);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0240
     * @tc.name      testPhotosUserFileDataItemState0240
     * @tc.desc      Checks media item trashed state sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0240 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_59', ['state_arg_59'], 'state_device_59', 360);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0240 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0241
     * @tc.name      testPhotosUserFileDataItemState0241
     * @tc.desc      Checks media item undefined state sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0241 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_60', ['state_arg_60'], 'state_device_60', 361);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('361');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0242
     * @tc.name      testPhotosUserFileDataItemState0242
     * @tc.desc      Checks media item partLoaded state sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0242 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_60', ['state_arg_60'], 'state_device_60', 361);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0243
     * @tc.name      testPhotosUserFileDataItemState0243
     * @tc.desc      Checks media item loaded state sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0243 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_60', ['state_arg_60'], 'state_device_60', 361);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0243 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0244
     * @tc.name      testPhotosUserFileDataItemState0244
     * @tc.desc      Checks media item trashed state sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0244 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_60', ['state_arg_60'], 'state_device_60', 361);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0244 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0245
     * @tc.name      testPhotosUserFileDataItemState0245
     * @tc.desc      Checks media item undefined state sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0245 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_61', ['state_arg_61'], 'state_device_61', 362);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('362');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0245 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0246
     * @tc.name      testPhotosUserFileDataItemState0246
     * @tc.desc      Checks media item partLoaded state sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0246 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_61', ['state_arg_61'], 'state_device_61', 362);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0246 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0247
     * @tc.name      testPhotosUserFileDataItemState0247
     * @tc.desc      Checks media item loaded state sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0247 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_61', ['state_arg_61'], 'state_device_61', 362);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0247 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0248
     * @tc.name      testPhotosUserFileDataItemState0248
     * @tc.desc      Checks media item trashed state sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0248 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_61', ['state_arg_61'], 'state_device_61', 362);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0248 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0249
     * @tc.name      testPhotosUserFileDataItemState0249
     * @tc.desc      Checks media item undefined state sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0249 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_62', ['state_arg_62'], 'state_device_62', 363);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('363');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0249 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0250
     * @tc.name      testPhotosUserFileDataItemState0250
     * @tc.desc      Checks media item partLoaded state sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0250 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_62', ['state_arg_62'], 'state_device_62', 363);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0250 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0251
     * @tc.name      testPhotosUserFileDataItemState0251
     * @tc.desc      Checks media item loaded state sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0251 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_62', ['state_arg_62'], 'state_device_62', 363);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0251 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0252
     * @tc.name      testPhotosUserFileDataItemState0252
     * @tc.desc      Checks media item trashed state sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0252 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_62', ['state_arg_62'], 'state_device_62', 363);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0252 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0253
     * @tc.name      testPhotosUserFileDataItemState0253
     * @tc.desc      Checks media item undefined state sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0253 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_63', ['state_arg_63'], 'state_device_63', 364);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('364');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0253 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0254
     * @tc.name      testPhotosUserFileDataItemState0254
     * @tc.desc      Checks media item partLoaded state sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0254 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_63', ['state_arg_63'], 'state_device_63', 364);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0254 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0255
     * @tc.name      testPhotosUserFileDataItemState0255
     * @tc.desc      Checks media item loaded state sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0255 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_63', ['state_arg_63'], 'state_device_63', 364);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0255 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0256
     * @tc.name      testPhotosUserFileDataItemState0256
     * @tc.desc      Checks media item trashed state sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0256 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_63', ['state_arg_63'], 'state_device_63', 364);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0256 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0257
     * @tc.name      testPhotosUserFileDataItemState0257
     * @tc.desc      Checks media item undefined state sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0257 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_64', ['state_arg_64'], 'state_device_64', 365);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('365');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0257 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0258
     * @tc.name      testPhotosUserFileDataItemState0258
     * @tc.desc      Checks media item partLoaded state sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0258 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_64', ['state_arg_64'], 'state_device_64', 365);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0258 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0259
     * @tc.name      testPhotosUserFileDataItemState0259
     * @tc.desc      Checks media item loaded state sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0259 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_64', ['state_arg_64'], 'state_device_64', 365);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0259 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0260
     * @tc.name      testPhotosUserFileDataItemState0260
     * @tc.desc      Checks media item trashed state sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0260 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_64', ['state_arg_64'], 'state_device_64', 365);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0260 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0261
     * @tc.name      testPhotosUserFileDataItemState0261
     * @tc.desc      Checks media item undefined state sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0261 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_65', ['state_arg_65'], 'state_device_65', 366);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('366');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0261 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0262
     * @tc.name      testPhotosUserFileDataItemState0262
     * @tc.desc      Checks media item partLoaded state sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0262 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_65', ['state_arg_65'], 'state_device_65', 366);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0262 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0263
     * @tc.name      testPhotosUserFileDataItemState0263
     * @tc.desc      Checks media item loaded state sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0263 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_65', ['state_arg_65'], 'state_device_65', 366);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0263 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0264
     * @tc.name      testPhotosUserFileDataItemState0264
     * @tc.desc      Checks media item trashed state sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0264 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_65', ['state_arg_65'], 'state_device_65', 366);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0264 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0265
     * @tc.name      testPhotosUserFileDataItemState0265
     * @tc.desc      Checks media item undefined state sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0265 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_66', ['state_arg_66'], 'state_device_66', 367);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('367');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0265 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0266
     * @tc.name      testPhotosUserFileDataItemState0266
     * @tc.desc      Checks media item partLoaded state sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0266 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_66', ['state_arg_66'], 'state_device_66', 367);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0266 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0267
     * @tc.name      testPhotosUserFileDataItemState0267
     * @tc.desc      Checks media item loaded state sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0267 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_66', ['state_arg_66'], 'state_device_66', 367);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0267 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0268
     * @tc.name      testPhotosUserFileDataItemState0268
     * @tc.desc      Checks media item trashed state sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0268 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_66', ['state_arg_66'], 'state_device_66', 367);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0268 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0269
     * @tc.name      testPhotosUserFileDataItemState0269
     * @tc.desc      Checks media item undefined state sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0269 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_67', ['state_arg_67'], 'state_device_67', 368);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('368');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0269 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0270
     * @tc.name      testPhotosUserFileDataItemState0270
     * @tc.desc      Checks media item partLoaded state sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0270 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_67', ['state_arg_67'], 'state_device_67', 368);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0270 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0271
     * @tc.name      testPhotosUserFileDataItemState0271
     * @tc.desc      Checks media item loaded state sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0271 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_67', ['state_arg_67'], 'state_device_67', 368);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0271 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0272
     * @tc.name      testPhotosUserFileDataItemState0272
     * @tc.desc      Checks media item trashed state sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0272 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_67', ['state_arg_67'], 'state_device_67', 368);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0272 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0273
     * @tc.name      testPhotosUserFileDataItemState0273
     * @tc.desc      Checks media item undefined state sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0273 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_68', ['state_arg_68'], 'state_device_68', 369);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('369');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0273 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0274
     * @tc.name      testPhotosUserFileDataItemState0274
     * @tc.desc      Checks media item partLoaded state sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0274 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_68', ['state_arg_68'], 'state_device_68', 369);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0274 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0275
     * @tc.name      testPhotosUserFileDataItemState0275
     * @tc.desc      Checks media item loaded state sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0275 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_68', ['state_arg_68'], 'state_device_68', 369);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0275 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0276
     * @tc.name      testPhotosUserFileDataItemState0276
     * @tc.desc      Checks media item trashed state sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0276 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_68', ['state_arg_68'], 'state_device_68', 369);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0276 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0277
     * @tc.name      testPhotosUserFileDataItemState0277
     * @tc.desc      Checks media item undefined state sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0277 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_69', ['state_arg_69'], 'state_device_69', 370);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('370');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0277 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0278
     * @tc.name      testPhotosUserFileDataItemState0278
     * @tc.desc      Checks media item partLoaded state sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0278 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_69', ['state_arg_69'], 'state_device_69', 370);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0278 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0279
     * @tc.name      testPhotosUserFileDataItemState0279
     * @tc.desc      Checks media item loaded state sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0279 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_69', ['state_arg_69'], 'state_device_69', 370);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0279 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0280
     * @tc.name      testPhotosUserFileDataItemState0280
     * @tc.desc      Checks media item trashed state sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0280 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_69', ['state_arg_69'], 'state_device_69', 370);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0280 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0281
     * @tc.name      testPhotosUserFileDataItemState0281
     * @tc.desc      Checks media item undefined state sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0281 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_70', ['state_arg_70'], 'state_device_70', 371);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('371');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0281 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0282
     * @tc.name      testPhotosUserFileDataItemState0282
     * @tc.desc      Checks media item partLoaded state sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0282 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_70', ['state_arg_70'], 'state_device_70', 371);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0282 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0283
     * @tc.name      testPhotosUserFileDataItemState0283
     * @tc.desc      Checks media item loaded state sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0283 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_70', ['state_arg_70'], 'state_device_70', 371);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0283 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0284
     * @tc.name      testPhotosUserFileDataItemState0284
     * @tc.desc      Checks media item trashed state sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0284 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_70', ['state_arg_70'], 'state_device_70', 371);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0284 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0285
     * @tc.name      testPhotosUserFileDataItemState0285
     * @tc.desc      Checks media item undefined state sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0285 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_71', ['state_arg_71'], 'state_device_71', 372);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('372');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0285 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0286
     * @tc.name      testPhotosUserFileDataItemState0286
     * @tc.desc      Checks media item partLoaded state sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0286 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_71', ['state_arg_71'], 'state_device_71', 372);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0286 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0287
     * @tc.name      testPhotosUserFileDataItemState0287
     * @tc.desc      Checks media item loaded state sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0287 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_71', ['state_arg_71'], 'state_device_71', 372);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0287 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0288
     * @tc.name      testPhotosUserFileDataItemState0288
     * @tc.desc      Checks media item trashed state sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0288 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_71', ['state_arg_71'], 'state_device_71', 372);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0288 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0289
     * @tc.name      testPhotosUserFileDataItemState0289
     * @tc.desc      Checks media item undefined state sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0289 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_72', ['state_arg_72'], 'state_device_72', 373);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('373');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0289 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0290
     * @tc.name      testPhotosUserFileDataItemState0290
     * @tc.desc      Checks media item partLoaded state sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0290 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_72', ['state_arg_72'], 'state_device_72', 373);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0290 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0291
     * @tc.name      testPhotosUserFileDataItemState0291
     * @tc.desc      Checks media item loaded state sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0291 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_72', ['state_arg_72'], 'state_device_72', 373);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0291 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0292
     * @tc.name      testPhotosUserFileDataItemState0292
     * @tc.desc      Checks media item trashed state sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0292 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_72', ['state_arg_72'], 'state_device_72', 373);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0292 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0293
     * @tc.name      testPhotosUserFileDataItemState0293
     * @tc.desc      Checks media item undefined state sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0293 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_73', ['state_arg_73'], 'state_device_73', 374);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('374');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0293 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0294
     * @tc.name      testPhotosUserFileDataItemState0294
     * @tc.desc      Checks media item partLoaded state sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0294 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_73', ['state_arg_73'], 'state_device_73', 374);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0294 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0295
     * @tc.name      testPhotosUserFileDataItemState0295
     * @tc.desc      Checks media item loaded state sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0295 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_73', ['state_arg_73'], 'state_device_73', 374);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0295 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0296
     * @tc.name      testPhotosUserFileDataItemState0296
     * @tc.desc      Checks media item trashed state sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0296 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_73', ['state_arg_73'], 'state_device_73', 374);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0296 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0297
     * @tc.name      testPhotosUserFileDataItemState0297
     * @tc.desc      Checks media item undefined state sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0297 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_74', ['state_arg_74'], 'state_device_74', 375);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('375');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0297 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0298
     * @tc.name      testPhotosUserFileDataItemState0298
     * @tc.desc      Checks media item partLoaded state sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0298 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_74', ['state_arg_74'], 'state_device_74', 375);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0298 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0299
     * @tc.name      testPhotosUserFileDataItemState0299
     * @tc.desc      Checks media item loaded state sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0299 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_74', ['state_arg_74'], 'state_device_74', 375);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0299 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0300
     * @tc.name      testPhotosUserFileDataItemState0300
     * @tc.desc      Checks media item trashed state sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0300 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_74', ['state_arg_74'], 'state_device_74', 375);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0300 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0301
     * @tc.name      testPhotosUserFileDataItemState0301
     * @tc.desc      Checks media item undefined state sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0301 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_75', ['state_arg_75'], 'state_device_75', 376);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('376');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0301 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0302
     * @tc.name      testPhotosUserFileDataItemState0302
     * @tc.desc      Checks media item partLoaded state sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0302 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_75', ['state_arg_75'], 'state_device_75', 376);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0302 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0303
     * @tc.name      testPhotosUserFileDataItemState0303
     * @tc.desc      Checks media item loaded state sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0303 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_75', ['state_arg_75'], 'state_device_75', 376);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0303 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0304
     * @tc.name      testPhotosUserFileDataItemState0304
     * @tc.desc      Checks media item trashed state sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0304 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_75', ['state_arg_75'], 'state_device_75', 376);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0304 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0305
     * @tc.name      testPhotosUserFileDataItemState0305
     * @tc.desc      Checks media item undefined state sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0305 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_76', ['state_arg_76'], 'state_device_76', 377);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('377');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0305 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0306
     * @tc.name      testPhotosUserFileDataItemState0306
     * @tc.desc      Checks media item partLoaded state sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0306 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_76', ['state_arg_76'], 'state_device_76', 377);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0306 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0307
     * @tc.name      testPhotosUserFileDataItemState0307
     * @tc.desc      Checks media item loaded state sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0307 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_76', ['state_arg_76'], 'state_device_76', 377);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0307 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0308
     * @tc.name      testPhotosUserFileDataItemState0308
     * @tc.desc      Checks media item trashed state sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0308 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_76', ['state_arg_76'], 'state_device_76', 377);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0308 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0309
     * @tc.name      testPhotosUserFileDataItemState0309
     * @tc.desc      Checks media item undefined state sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0309 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_77', ['state_arg_77'], 'state_device_77', 378);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('378');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0309 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0310
     * @tc.name      testPhotosUserFileDataItemState0310
     * @tc.desc      Checks media item partLoaded state sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0310 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_77', ['state_arg_77'], 'state_device_77', 378);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0310 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0311
     * @tc.name      testPhotosUserFileDataItemState0311
     * @tc.desc      Checks media item loaded state sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0311 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_77', ['state_arg_77'], 'state_device_77', 378);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0311 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0312
     * @tc.name      testPhotosUserFileDataItemState0312
     * @tc.desc      Checks media item trashed state sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0312 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_77', ['state_arg_77'], 'state_device_77', 378);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0312 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0313
     * @tc.name      testPhotosUserFileDataItemState0313
     * @tc.desc      Checks media item undefined state sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0313 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_78', ['state_arg_78'], 'state_device_78', 379);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('379');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0313 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0314
     * @tc.name      testPhotosUserFileDataItemState0314
     * @tc.desc      Checks media item partLoaded state sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0314 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_78', ['state_arg_78'], 'state_device_78', 379);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0314 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0315
     * @tc.name      testPhotosUserFileDataItemState0315
     * @tc.desc      Checks media item loaded state sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0315 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_78', ['state_arg_78'], 'state_device_78', 379);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0315 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0316
     * @tc.name      testPhotosUserFileDataItemState0316
     * @tc.desc      Checks media item trashed state sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0316 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_78', ['state_arg_78'], 'state_device_78', 379);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0316 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0317
     * @tc.name      testPhotosUserFileDataItemState0317
     * @tc.desc      Checks media item undefined state sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0317 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_79', ['state_arg_79'], 'state_device_79', 380);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('380');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0317 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0318
     * @tc.name      testPhotosUserFileDataItemState0318
     * @tc.desc      Checks media item partLoaded state sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0318 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_79', ['state_arg_79'], 'state_device_79', 380);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0318 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0319
     * @tc.name      testPhotosUserFileDataItemState0319
     * @tc.desc      Checks media item loaded state sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0319 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_79', ['state_arg_79'], 'state_device_79', 380);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0319 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0320
     * @tc.name      testPhotosUserFileDataItemState0320
     * @tc.desc      Checks media item trashed state sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0320 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_79', ['state_arg_79'], 'state_device_79', 380);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0320 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0321
     * @tc.name      testPhotosUserFileDataItemState0321
     * @tc.desc      Checks media item undefined state sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0321 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_80', ['state_arg_80'], 'state_device_80', 381);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('381');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0321 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0322
     * @tc.name      testPhotosUserFileDataItemState0322
     * @tc.desc      Checks media item partLoaded state sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0322 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_80', ['state_arg_80'], 'state_device_80', 381);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0322 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0323
     * @tc.name      testPhotosUserFileDataItemState0323
     * @tc.desc      Checks media item loaded state sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0323 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_80', ['state_arg_80'], 'state_device_80', 381);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0323 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0324
     * @tc.name      testPhotosUserFileDataItemState0324
     * @tc.desc      Checks media item trashed state sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0324 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_80', ['state_arg_80'], 'state_device_80', 381);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0324 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0325
     * @tc.name      testPhotosUserFileDataItemState0325
     * @tc.desc      Checks media item undefined state sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0325 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_81', ['state_arg_81'], 'state_device_81', 382);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('382');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0325 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0326
     * @tc.name      testPhotosUserFileDataItemState0326
     * @tc.desc      Checks media item partLoaded state sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0326 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_81', ['state_arg_81'], 'state_device_81', 382);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0326 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0327
     * @tc.name      testPhotosUserFileDataItemState0327
     * @tc.desc      Checks media item loaded state sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0327 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_81', ['state_arg_81'], 'state_device_81', 382);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0327 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0328
     * @tc.name      testPhotosUserFileDataItemState0328
     * @tc.desc      Checks media item trashed state sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0328 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_81', ['state_arg_81'], 'state_device_81', 382);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0328 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0329
     * @tc.name      testPhotosUserFileDataItemState0329
     * @tc.desc      Checks media item undefined state sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0329 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_82', ['state_arg_82'], 'state_device_82', 383);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('383');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0329 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0330
     * @tc.name      testPhotosUserFileDataItemState0330
     * @tc.desc      Checks media item partLoaded state sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0330 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_82', ['state_arg_82'], 'state_device_82', 383);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0330 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0331
     * @tc.name      testPhotosUserFileDataItemState0331
     * @tc.desc      Checks media item loaded state sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0331 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_82', ['state_arg_82'], 'state_device_82', 383);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0331 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0332
     * @tc.name      testPhotosUserFileDataItemState0332
     * @tc.desc      Checks media item trashed state sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0332 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_82', ['state_arg_82'], 'state_device_82', 383);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0332 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0333
     * @tc.name      testPhotosUserFileDataItemState0333
     * @tc.desc      Checks media item undefined state sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0333 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_83', ['state_arg_83'], 'state_device_83', 384);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('384');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0333 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0334
     * @tc.name      testPhotosUserFileDataItemState0334
     * @tc.desc      Checks media item partLoaded state sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0334 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_83', ['state_arg_83'], 'state_device_83', 384);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0334 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0335
     * @tc.name      testPhotosUserFileDataItemState0335
     * @tc.desc      Checks media item loaded state sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0335 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_83', ['state_arg_83'], 'state_device_83', 384);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0335 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0336
     * @tc.name      testPhotosUserFileDataItemState0336
     * @tc.desc      Checks media item trashed state sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0336 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_83', ['state_arg_83'], 'state_device_83', 384);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0336 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0337
     * @tc.name      testPhotosUserFileDataItemState0337
     * @tc.desc      Checks media item undefined state sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0337 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_84', ['state_arg_84'], 'state_device_84', 385);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('385');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0337 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0338
     * @tc.name      testPhotosUserFileDataItemState0338
     * @tc.desc      Checks media item partLoaded state sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0338 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_84', ['state_arg_84'], 'state_device_84', 385);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0338 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0339
     * @tc.name      testPhotosUserFileDataItemState0339
     * @tc.desc      Checks media item loaded state sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0339 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_84', ['state_arg_84'], 'state_device_84', 385);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0339 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0340
     * @tc.name      testPhotosUserFileDataItemState0340
     * @tc.desc      Checks media item trashed state sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0340 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_84', ['state_arg_84'], 'state_device_84', 385);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0340 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0341
     * @tc.name      testPhotosUserFileDataItemState0341
     * @tc.desc      Checks media item undefined state sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0341 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_85', ['state_arg_85'], 'state_device_85', 386);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('386');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0341 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0342
     * @tc.name      testPhotosUserFileDataItemState0342
     * @tc.desc      Checks media item partLoaded state sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0342 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_85', ['state_arg_85'], 'state_device_85', 386);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0342 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0343
     * @tc.name      testPhotosUserFileDataItemState0343
     * @tc.desc      Checks media item loaded state sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0343 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_85', ['state_arg_85'], 'state_device_85', 386);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0343 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0344
     * @tc.name      testPhotosUserFileDataItemState0344
     * @tc.desc      Checks media item trashed state sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0344 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_85', ['state_arg_85'], 'state_device_85', 386);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0344 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0345
     * @tc.name      testPhotosUserFileDataItemState0345
     * @tc.desc      Checks media item undefined state sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0345 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_86', ['state_arg_86'], 'state_device_86', 387);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('387');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0345 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0346
     * @tc.name      testPhotosUserFileDataItemState0346
     * @tc.desc      Checks media item partLoaded state sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0346 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_86', ['state_arg_86'], 'state_device_86', 387);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0346 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0347
     * @tc.name      testPhotosUserFileDataItemState0347
     * @tc.desc      Checks media item loaded state sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0347 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_86', ['state_arg_86'], 'state_device_86', 387);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0347 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0348
     * @tc.name      testPhotosUserFileDataItemState0348
     * @tc.desc      Checks media item trashed state sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0348 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_86', ['state_arg_86'], 'state_device_86', 387);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0348 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0349
     * @tc.name      testPhotosUserFileDataItemState0349
     * @tc.desc      Checks media item undefined state sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0349 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_87', ['state_arg_87'], 'state_device_87', 388);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('388');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0349 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0350
     * @tc.name      testPhotosUserFileDataItemState0350
     * @tc.desc      Checks media item partLoaded state sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0350 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_87', ['state_arg_87'], 'state_device_87', 388);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0350 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0351
     * @tc.name      testPhotosUserFileDataItemState0351
     * @tc.desc      Checks media item loaded state sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0351 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_87', ['state_arg_87'], 'state_device_87', 388);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0351 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0352
     * @tc.name      testPhotosUserFileDataItemState0352
     * @tc.desc      Checks media item trashed state sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0352 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_87', ['state_arg_87'], 'state_device_87', 388);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0352 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0353
     * @tc.name      testPhotosUserFileDataItemState0353
     * @tc.desc      Checks media item undefined state sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0353 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_88', ['state_arg_88'], 'state_device_88', 389);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('389');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0353 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0354
     * @tc.name      testPhotosUserFileDataItemState0354
     * @tc.desc      Checks media item partLoaded state sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0354 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_88', ['state_arg_88'], 'state_device_88', 389);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0354 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0355
     * @tc.name      testPhotosUserFileDataItemState0355
     * @tc.desc      Checks media item loaded state sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0355 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_88', ['state_arg_88'], 'state_device_88', 389);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0355 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0356
     * @tc.name      testPhotosUserFileDataItemState0356
     * @tc.desc      Checks media item trashed state sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0356 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_88', ['state_arg_88'], 'state_device_88', 389);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0356 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0357
     * @tc.name      testPhotosUserFileDataItemState0357
     * @tc.desc      Checks media item undefined state sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0357 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_89', ['state_arg_89'], 'state_device_89', 390);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('390');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0357 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0358
     * @tc.name      testPhotosUserFileDataItemState0358
     * @tc.desc      Checks media item partLoaded state sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0358 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_89', ['state_arg_89'], 'state_device_89', 390);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0358 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0359
     * @tc.name      testPhotosUserFileDataItemState0359
     * @tc.desc      Checks media item loaded state sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0359 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_89', ['state_arg_89'], 'state_device_89', 390);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0359 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0360
     * @tc.name      testPhotosUserFileDataItemState0360
     * @tc.desc      Checks media item trashed state sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0360 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_89', ['state_arg_89'], 'state_device_89', 390);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0360 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0361
     * @tc.name      testPhotosUserFileDataItemState0361
     * @tc.desc      Checks media item undefined state sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0361 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_90', ['state_arg_90'], 'state_device_90', 391);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('391');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0361 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0362
     * @tc.name      testPhotosUserFileDataItemState0362
     * @tc.desc      Checks media item partLoaded state sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0362 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_90', ['state_arg_90'], 'state_device_90', 391);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0362 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0363
     * @tc.name      testPhotosUserFileDataItemState0363
     * @tc.desc      Checks media item loaded state sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0363 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_90', ['state_arg_90'], 'state_device_90', 391);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0363 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0364
     * @tc.name      testPhotosUserFileDataItemState0364
     * @tc.desc      Checks media item trashed state sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0364 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_90', ['state_arg_90'], 'state_device_90', 391);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0364 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0365
     * @tc.name      testPhotosUserFileDataItemState0365
     * @tc.desc      Checks media item undefined state sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0365 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_91', ['state_arg_91'], 'state_device_91', 392);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('392');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0365 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0366
     * @tc.name      testPhotosUserFileDataItemState0366
     * @tc.desc      Checks media item partLoaded state sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0366 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_91', ['state_arg_91'], 'state_device_91', 392);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0366 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0367
     * @tc.name      testPhotosUserFileDataItemState0367
     * @tc.desc      Checks media item loaded state sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0367 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_91', ['state_arg_91'], 'state_device_91', 392);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0367 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0368
     * @tc.name      testPhotosUserFileDataItemState0368
     * @tc.desc      Checks media item trashed state sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0368 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_91', ['state_arg_91'], 'state_device_91', 392);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0368 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0369
     * @tc.name      testPhotosUserFileDataItemState0369
     * @tc.desc      Checks media item undefined state sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0369 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_92', ['state_arg_92'], 'state_device_92', 393);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('393');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0369 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0370
     * @tc.name      testPhotosUserFileDataItemState0370
     * @tc.desc      Checks media item partLoaded state sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0370 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_92', ['state_arg_92'], 'state_device_92', 393);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0370 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0371
     * @tc.name      testPhotosUserFileDataItemState0371
     * @tc.desc      Checks media item loaded state sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0371 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_92', ['state_arg_92'], 'state_device_92', 393);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0371 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0372
     * @tc.name      testPhotosUserFileDataItemState0372
     * @tc.desc      Checks media item trashed state sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0372 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_92', ['state_arg_92'], 'state_device_92', 393);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0372 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0373
     * @tc.name      testPhotosUserFileDataItemState0373
     * @tc.desc      Checks media item undefined state sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0373 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_93', ['state_arg_93'], 'state_device_93', 394);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('394');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0373 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0374
     * @tc.name      testPhotosUserFileDataItemState0374
     * @tc.desc      Checks media item partLoaded state sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0374 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_93', ['state_arg_93'], 'state_device_93', 394);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0374 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0375
     * @tc.name      testPhotosUserFileDataItemState0375
     * @tc.desc      Checks media item loaded state sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0375 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_93', ['state_arg_93'], 'state_device_93', 394);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0375 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0376
     * @tc.name      testPhotosUserFileDataItemState0376
     * @tc.desc      Checks media item trashed state sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0376 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_93', ['state_arg_93'], 'state_device_93', 394);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0376 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0377
     * @tc.name      testPhotosUserFileDataItemState0377
     * @tc.desc      Checks media item undefined state sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0377 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_94', ['state_arg_94'], 'state_device_94', 395);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('395');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0377 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0378
     * @tc.name      testPhotosUserFileDataItemState0378
     * @tc.desc      Checks media item partLoaded state sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0378 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_94', ['state_arg_94'], 'state_device_94', 395);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0378 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0379
     * @tc.name      testPhotosUserFileDataItemState0379
     * @tc.desc      Checks media item loaded state sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0379 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_94', ['state_arg_94'], 'state_device_94', 395);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0379 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0380
     * @tc.name      testPhotosUserFileDataItemState0380
     * @tc.desc      Checks media item trashed state sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0380 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_94', ['state_arg_94'], 'state_device_94', 395);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0380 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0381
     * @tc.name      testPhotosUserFileDataItemState0381
     * @tc.desc      Checks media item undefined state sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0381 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_95', ['state_arg_95'], 'state_device_95', 396);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('396');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0381 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0382
     * @tc.name      testPhotosUserFileDataItemState0382
     * @tc.desc      Checks media item partLoaded state sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0382 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_95', ['state_arg_95'], 'state_device_95', 396);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0382 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0383
     * @tc.name      testPhotosUserFileDataItemState0383
     * @tc.desc      Checks media item loaded state sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0383 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_95', ['state_arg_95'], 'state_device_95', 396);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0383 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0384
     * @tc.name      testPhotosUserFileDataItemState0384
     * @tc.desc      Checks media item trashed state sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0384 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_95', ['state_arg_95'], 'state_device_95', 396);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0384 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0385
     * @tc.name      testPhotosUserFileDataItemState0385
     * @tc.desc      Checks media item undefined state sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0385 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_96', ['state_arg_96'], 'state_device_96', 397);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('397');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0385 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0386
     * @tc.name      testPhotosUserFileDataItemState0386
     * @tc.desc      Checks media item partLoaded state sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0386 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_96', ['state_arg_96'], 'state_device_96', 397);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0386 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0387
     * @tc.name      testPhotosUserFileDataItemState0387
     * @tc.desc      Checks media item loaded state sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0387 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_96', ['state_arg_96'], 'state_device_96', 397);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0387 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0388
     * @tc.name      testPhotosUserFileDataItemState0388
     * @tc.desc      Checks media item trashed state sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0388 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_96', ['state_arg_96'], 'state_device_96', 397);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0388 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0389
     * @tc.name      testPhotosUserFileDataItemState0389
     * @tc.desc      Checks media item undefined state sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0389 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_97', ['state_arg_97'], 'state_device_97', 398);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('398');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0389 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0390
     * @tc.name      testPhotosUserFileDataItemState0390
     * @tc.desc      Checks media item partLoaded state sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0390 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_97', ['state_arg_97'], 'state_device_97', 398);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0390 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0391
     * @tc.name      testPhotosUserFileDataItemState0391
     * @tc.desc      Checks media item loaded state sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0391 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_97', ['state_arg_97'], 'state_device_97', 398);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0391 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0392
     * @tc.name      testPhotosUserFileDataItemState0392
     * @tc.desc      Checks media item trashed state sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0392 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_97', ['state_arg_97'], 'state_device_97', 398);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0392 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0393
     * @tc.name      testPhotosUserFileDataItemState0393
     * @tc.desc      Checks media item undefined state sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0393 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_98', ['state_arg_98'], 'state_device_98', 399);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('399');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0393 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0394
     * @tc.name      testPhotosUserFileDataItemState0394
     * @tc.desc      Checks media item partLoaded state sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0394 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_98', ['state_arg_98'], 'state_device_98', 399);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0394 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0395
     * @tc.name      testPhotosUserFileDataItemState0395
     * @tc.desc      Checks media item loaded state sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0395 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_98', ['state_arg_98'], 'state_device_98', 399);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0395 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0396
     * @tc.name      testPhotosUserFileDataItemState0396
     * @tc.desc      Checks media item trashed state sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0396 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_98', ['state_arg_98'], 'state_device_98', 399);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0396 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0397
     * @tc.name      testPhotosUserFileDataItemState0397
     * @tc.desc      Checks media item undefined state sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0397 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_99', ['state_arg_99'], 'state_device_99', 400);
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      expect(item.isLoad()).assertFalse();
      expect(item.getHashCode()).assertEqual('400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0397 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0398
     * @tc.name      testPhotosUserFileDataItemState0398
     * @tc.desc      Checks media item partLoaded state sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0398 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_99', ['state_arg_99'], 'state_device_99', 400);
      item.status = MediaConstants.PART_LOADED;
      expect(item.status).assertEqual(MediaConstants.PART_LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0398 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0399
     * @tc.name      testPhotosUserFileDataItemState0399
     * @tc.desc      Checks media item loaded state sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0399 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_99', ['state_arg_99'], 'state_device_99', 400);
      item.status = MediaConstants.LOADED;
      expect(item.status).assertEqual(MediaConstants.LOADED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0399 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_STATE_0400
     * @tc.name      testPhotosUserFileDataItemState0400
     * @tc.desc      Checks media item trashed state sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemState0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0400 begin');
      const item: UserFileDataItem = new UserFileDataItem('state_99', ['state_arg_99'], 'state_device_99', 400);
      item.status = MediaConstants.TRASHED;
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemState0400 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0001
     * @tc.name      testPhotosUserFileDataItemHashState0001
     * @tc.desc      Builds hash for PART_LOADED state sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_0', 401);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/0';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/01 270 true');
      expect(item.getHashCode() === '401').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0002
     * @tc.name      testPhotosUserFileDataItemHashState0002
     * @tc.desc      Builds hash for LOADED state sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_1', 402);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/1';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/10 0 false');
      expect(item.getHashCode() === '402').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0003
     * @tc.name      testPhotosUserFileDataItemHashState0003
     * @tc.desc      Builds hash for TRASHED state sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_2', 403);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/2';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/21 90 true');
      expect(item.getHashCode() === '403').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0004
     * @tc.name      testPhotosUserFileDataItemHashState0004
     * @tc.desc      Builds hash for PART_LOADED state sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_3', 404);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/3';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/30 180 false');
      expect(item.getHashCode() === '404').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0005
     * @tc.name      testPhotosUserFileDataItemHashState0005
     * @tc.desc      Builds hash for LOADED state sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_4', 405);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/4';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/41 270 true');
      expect(item.getHashCode() === '405').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0006
     * @tc.name      testPhotosUserFileDataItemHashState0006
     * @tc.desc      Builds hash for TRASHED state sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_5', 406);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/5';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/50 0 false');
      expect(item.getHashCode() === '406').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0007
     * @tc.name      testPhotosUserFileDataItemHashState0007
     * @tc.desc      Builds hash for PART_LOADED state sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_6', 407);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/6';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/61 90 true');
      expect(item.getHashCode() === '407').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0008
     * @tc.name      testPhotosUserFileDataItemHashState0008
     * @tc.desc      Builds hash for LOADED state sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_7', 408);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/7';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/70 180 false');
      expect(item.getHashCode() === '408').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0009
     * @tc.name      testPhotosUserFileDataItemHashState0009
     * @tc.desc      Builds hash for TRASHED state sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_8', 409);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/8';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/81 270 true');
      expect(item.getHashCode() === '409').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0010
     * @tc.name      testPhotosUserFileDataItemHashState0010
     * @tc.desc      Builds hash for PART_LOADED state sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_9', 410);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/9';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/90 0 false');
      expect(item.getHashCode() === '410').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0011
     * @tc.name      testPhotosUserFileDataItemHashState0011
     * @tc.desc      Builds hash for LOADED state sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_10', 411);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/10';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/101 90 true');
      expect(item.getHashCode() === '411').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0012
     * @tc.name      testPhotosUserFileDataItemHashState0012
     * @tc.desc      Builds hash for TRASHED state sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_11', 412);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/11';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/110 180 false');
      expect(item.getHashCode() === '412').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0013
     * @tc.name      testPhotosUserFileDataItemHashState0013
     * @tc.desc      Builds hash for PART_LOADED state sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_12', 413);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/12';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/121 270 true');
      expect(item.getHashCode() === '413').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0014
     * @tc.name      testPhotosUserFileDataItemHashState0014
     * @tc.desc      Builds hash for LOADED state sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_13', 414);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/13';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/130 0 false');
      expect(item.getHashCode() === '414').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0015
     * @tc.name      testPhotosUserFileDataItemHashState0015
     * @tc.desc      Builds hash for TRASHED state sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_14', 415);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/14';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/141 90 true');
      expect(item.getHashCode() === '415').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0016
     * @tc.name      testPhotosUserFileDataItemHashState0016
     * @tc.desc      Builds hash for PART_LOADED state sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_15', 416);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/15';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/150 180 false');
      expect(item.getHashCode() === '416').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0017
     * @tc.name      testPhotosUserFileDataItemHashState0017
     * @tc.desc      Builds hash for LOADED state sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_16', 417);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/16';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/161 270 true');
      expect(item.getHashCode() === '417').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0018
     * @tc.name      testPhotosUserFileDataItemHashState0018
     * @tc.desc      Builds hash for TRASHED state sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_17', 418);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/17';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/170 0 false');
      expect(item.getHashCode() === '418').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0019
     * @tc.name      testPhotosUserFileDataItemHashState0019
     * @tc.desc      Builds hash for PART_LOADED state sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_18', 419);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/18';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/181 90 true');
      expect(item.getHashCode() === '419').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0020
     * @tc.name      testPhotosUserFileDataItemHashState0020
     * @tc.desc      Builds hash for LOADED state sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_19', 420);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/19';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/190 180 false');
      expect(item.getHashCode() === '420').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0021
     * @tc.name      testPhotosUserFileDataItemHashState0021
     * @tc.desc      Builds hash for TRASHED state sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_20', 421);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/20';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/201 270 true');
      expect(item.getHashCode() === '421').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0022
     * @tc.name      testPhotosUserFileDataItemHashState0022
     * @tc.desc      Builds hash for PART_LOADED state sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_21', 422);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/21';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/210 0 false');
      expect(item.getHashCode() === '422').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0023
     * @tc.name      testPhotosUserFileDataItemHashState0023
     * @tc.desc      Builds hash for LOADED state sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_22', 423);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/22';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/221 90 true');
      expect(item.getHashCode() === '423').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0024
     * @tc.name      testPhotosUserFileDataItemHashState0024
     * @tc.desc      Builds hash for TRASHED state sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_23', 424);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/23';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/230 180 false');
      expect(item.getHashCode() === '424').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0025
     * @tc.name      testPhotosUserFileDataItemHashState0025
     * @tc.desc      Builds hash for PART_LOADED state sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_24', 425);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/24';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/241 270 true');
      expect(item.getHashCode() === '425').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0026
     * @tc.name      testPhotosUserFileDataItemHashState0026
     * @tc.desc      Builds hash for LOADED state sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_25', 426);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/25';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/250 0 false');
      expect(item.getHashCode() === '426').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0027
     * @tc.name      testPhotosUserFileDataItemHashState0027
     * @tc.desc      Builds hash for TRASHED state sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_26', 427);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/26';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/261 90 true');
      expect(item.getHashCode() === '427').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0028
     * @tc.name      testPhotosUserFileDataItemHashState0028
     * @tc.desc      Builds hash for PART_LOADED state sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_27', 428);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/27';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/270 180 false');
      expect(item.getHashCode() === '428').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0029
     * @tc.name      testPhotosUserFileDataItemHashState0029
     * @tc.desc      Builds hash for LOADED state sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_28', 429);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/28';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/281 270 true');
      expect(item.getHashCode() === '429').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0030
     * @tc.name      testPhotosUserFileDataItemHashState0030
     * @tc.desc      Builds hash for TRASHED state sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_29', 430);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/29';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/290 0 false');
      expect(item.getHashCode() === '430').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0031
     * @tc.name      testPhotosUserFileDataItemHashState0031
     * @tc.desc      Builds hash for PART_LOADED state sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_30', 431);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/30';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/301 90 true');
      expect(item.getHashCode() === '431').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0032
     * @tc.name      testPhotosUserFileDataItemHashState0032
     * @tc.desc      Builds hash for LOADED state sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_31', 432);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/31';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/310 180 false');
      expect(item.getHashCode() === '432').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0033
     * @tc.name      testPhotosUserFileDataItemHashState0033
     * @tc.desc      Builds hash for TRASHED state sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_32', 433);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/32';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/321 270 true');
      expect(item.getHashCode() === '433').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0034
     * @tc.name      testPhotosUserFileDataItemHashState0034
     * @tc.desc      Builds hash for PART_LOADED state sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_33', 434);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/33';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/330 0 false');
      expect(item.getHashCode() === '434').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0035
     * @tc.name      testPhotosUserFileDataItemHashState0035
     * @tc.desc      Builds hash for LOADED state sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_34', 435);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/34';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/341 90 true');
      expect(item.getHashCode() === '435').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0036
     * @tc.name      testPhotosUserFileDataItemHashState0036
     * @tc.desc      Builds hash for TRASHED state sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_35', 436);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/35';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/350 180 false');
      expect(item.getHashCode() === '436').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0037
     * @tc.name      testPhotosUserFileDataItemHashState0037
     * @tc.desc      Builds hash for PART_LOADED state sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_36', 437);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/36';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/361 270 true');
      expect(item.getHashCode() === '437').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0038
     * @tc.name      testPhotosUserFileDataItemHashState0038
     * @tc.desc      Builds hash for LOADED state sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_37', 438);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/37';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/370 0 false');
      expect(item.getHashCode() === '438').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0039
     * @tc.name      testPhotosUserFileDataItemHashState0039
     * @tc.desc      Builds hash for TRASHED state sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_38', 439);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/38';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/381 90 true');
      expect(item.getHashCode() === '439').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0040
     * @tc.name      testPhotosUserFileDataItemHashState0040
     * @tc.desc      Builds hash for PART_LOADED state sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_39', 440);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/39';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/390 180 false');
      expect(item.getHashCode() === '440').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0041
     * @tc.name      testPhotosUserFileDataItemHashState0041
     * @tc.desc      Builds hash for LOADED state sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_40', 441);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/40';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/401 270 true');
      expect(item.getHashCode() === '441').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0042
     * @tc.name      testPhotosUserFileDataItemHashState0042
     * @tc.desc      Builds hash for TRASHED state sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_41', 442);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/41';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/410 0 false');
      expect(item.getHashCode() === '442').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0043
     * @tc.name      testPhotosUserFileDataItemHashState0043
     * @tc.desc      Builds hash for PART_LOADED state sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_42', 443);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/42';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/421 90 true');
      expect(item.getHashCode() === '443').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0044
     * @tc.name      testPhotosUserFileDataItemHashState0044
     * @tc.desc      Builds hash for LOADED state sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_43', 444);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/43';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/430 180 false');
      expect(item.getHashCode() === '444').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0045
     * @tc.name      testPhotosUserFileDataItemHashState0045
     * @tc.desc      Builds hash for TRASHED state sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_44', 445);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/44';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/441 270 true');
      expect(item.getHashCode() === '445').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0046
     * @tc.name      testPhotosUserFileDataItemHashState0046
     * @tc.desc      Builds hash for PART_LOADED state sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_45', 446);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/45';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/450 0 false');
      expect(item.getHashCode() === '446').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0047
     * @tc.name      testPhotosUserFileDataItemHashState0047
     * @tc.desc      Builds hash for LOADED state sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_46', 447);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/46';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/461 90 true');
      expect(item.getHashCode() === '447').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0048
     * @tc.name      testPhotosUserFileDataItemHashState0048
     * @tc.desc      Builds hash for TRASHED state sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_47', 448);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/47';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/470 180 false');
      expect(item.getHashCode() === '448').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0049
     * @tc.name      testPhotosUserFileDataItemHashState0049
     * @tc.desc      Builds hash for PART_LOADED state sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_48', 449);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/48';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/481 270 true');
      expect(item.getHashCode() === '449').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0050
     * @tc.name      testPhotosUserFileDataItemHashState0050
     * @tc.desc      Builds hash for LOADED state sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_49', 450);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/49';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/490 0 false');
      expect(item.getHashCode() === '450').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0051
     * @tc.name      testPhotosUserFileDataItemHashState0051
     * @tc.desc      Builds hash for TRASHED state sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_50', 451);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/50';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/501 90 true');
      expect(item.getHashCode() === '451').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0052
     * @tc.name      testPhotosUserFileDataItemHashState0052
     * @tc.desc      Builds hash for PART_LOADED state sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_51', 452);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/51';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/510 180 false');
      expect(item.getHashCode() === '452').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0053
     * @tc.name      testPhotosUserFileDataItemHashState0053
     * @tc.desc      Builds hash for LOADED state sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_52', 453);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/52';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/521 270 true');
      expect(item.getHashCode() === '453').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0054
     * @tc.name      testPhotosUserFileDataItemHashState0054
     * @tc.desc      Builds hash for TRASHED state sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_53', 454);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/53';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/530 0 false');
      expect(item.getHashCode() === '454').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0055
     * @tc.name      testPhotosUserFileDataItemHashState0055
     * @tc.desc      Builds hash for PART_LOADED state sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_54', 455);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/54';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/541 90 true');
      expect(item.getHashCode() === '455').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0056
     * @tc.name      testPhotosUserFileDataItemHashState0056
     * @tc.desc      Builds hash for LOADED state sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_55', 456);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/55';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/550 180 false');
      expect(item.getHashCode() === '456').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0057
     * @tc.name      testPhotosUserFileDataItemHashState0057
     * @tc.desc      Builds hash for TRASHED state sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_56', 457);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/56';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/561 270 true');
      expect(item.getHashCode() === '457').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0058
     * @tc.name      testPhotosUserFileDataItemHashState0058
     * @tc.desc      Builds hash for PART_LOADED state sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_57', 458);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/57';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/570 0 false');
      expect(item.getHashCode() === '458').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0059
     * @tc.name      testPhotosUserFileDataItemHashState0059
     * @tc.desc      Builds hash for LOADED state sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_58', 459);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/58';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/581 90 true');
      expect(item.getHashCode() === '459').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0060
     * @tc.name      testPhotosUserFileDataItemHashState0060
     * @tc.desc      Builds hash for TRASHED state sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_59', 460);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/59';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/590 180 false');
      expect(item.getHashCode() === '460').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0061
     * @tc.name      testPhotosUserFileDataItemHashState0061
     * @tc.desc      Builds hash for PART_LOADED state sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0061 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_60', 461);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/60';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/601 270 true');
      expect(item.getHashCode() === '461').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_60');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0062
     * @tc.name      testPhotosUserFileDataItemHashState0062
     * @tc.desc      Builds hash for LOADED state sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0062 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_61', 462);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/61';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/610 0 false');
      expect(item.getHashCode() === '462').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_61');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0063
     * @tc.name      testPhotosUserFileDataItemHashState0063
     * @tc.desc      Builds hash for TRASHED state sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0063 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_62', 463);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/62';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/621 90 true');
      expect(item.getHashCode() === '463').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_62');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0064
     * @tc.name      testPhotosUserFileDataItemHashState0064
     * @tc.desc      Builds hash for PART_LOADED state sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0064 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_63', 464);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/63';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/630 180 false');
      expect(item.getHashCode() === '464').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_63');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0065
     * @tc.name      testPhotosUserFileDataItemHashState0065
     * @tc.desc      Builds hash for LOADED state sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0065 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_64', 465);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/64';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/641 270 true');
      expect(item.getHashCode() === '465').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_64');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0066
     * @tc.name      testPhotosUserFileDataItemHashState0066
     * @tc.desc      Builds hash for TRASHED state sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0066 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_65', 466);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/65';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/650 0 false');
      expect(item.getHashCode() === '466').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_65');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0067
     * @tc.name      testPhotosUserFileDataItemHashState0067
     * @tc.desc      Builds hash for PART_LOADED state sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0067 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_66', 467);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/66';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/661 90 true');
      expect(item.getHashCode() === '467').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_66');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0068
     * @tc.name      testPhotosUserFileDataItemHashState0068
     * @tc.desc      Builds hash for LOADED state sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0068 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_67', 468);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/67';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/670 180 false');
      expect(item.getHashCode() === '468').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_67');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0069
     * @tc.name      testPhotosUserFileDataItemHashState0069
     * @tc.desc      Builds hash for TRASHED state sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0069 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_68', 469);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/68';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/681 270 true');
      expect(item.getHashCode() === '469').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_68');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0070
     * @tc.name      testPhotosUserFileDataItemHashState0070
     * @tc.desc      Builds hash for PART_LOADED state sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0070 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_69', 470);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/69';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/690 0 false');
      expect(item.getHashCode() === '470').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_69');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0071
     * @tc.name      testPhotosUserFileDataItemHashState0071
     * @tc.desc      Builds hash for LOADED state sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0071 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_70', 471);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/70';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/701 90 true');
      expect(item.getHashCode() === '471').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_70');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0072
     * @tc.name      testPhotosUserFileDataItemHashState0072
     * @tc.desc      Builds hash for TRASHED state sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0072 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_71', 472);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/71';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/710 180 false');
      expect(item.getHashCode() === '472').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_71');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0073
     * @tc.name      testPhotosUserFileDataItemHashState0073
     * @tc.desc      Builds hash for PART_LOADED state sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0073 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_72', 473);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/72';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/721 270 true');
      expect(item.getHashCode() === '473').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_72');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0074
     * @tc.name      testPhotosUserFileDataItemHashState0074
     * @tc.desc      Builds hash for LOADED state sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0074 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_73', 474);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/73';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/730 0 false');
      expect(item.getHashCode() === '474').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_73');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0075
     * @tc.name      testPhotosUserFileDataItemHashState0075
     * @tc.desc      Builds hash for TRASHED state sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0075 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_74', 475);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/74';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/741 90 true');
      expect(item.getHashCode() === '475').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_74');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0076
     * @tc.name      testPhotosUserFileDataItemHashState0076
     * @tc.desc      Builds hash for PART_LOADED state sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0076 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_75', 476);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/75';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/750 180 false');
      expect(item.getHashCode() === '476').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_75');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0077
     * @tc.name      testPhotosUserFileDataItemHashState0077
     * @tc.desc      Builds hash for LOADED state sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0077 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_76', 477);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/76';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/761 270 true');
      expect(item.getHashCode() === '477').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_76');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0078
     * @tc.name      testPhotosUserFileDataItemHashState0078
     * @tc.desc      Builds hash for TRASHED state sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0078 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_77', 478);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/77';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/770 0 false');
      expect(item.getHashCode() === '478').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_77');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0079
     * @tc.name      testPhotosUserFileDataItemHashState0079
     * @tc.desc      Builds hash for PART_LOADED state sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0079 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_78', 479);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/78';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/781 90 true');
      expect(item.getHashCode() === '479').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_78');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0080
     * @tc.name      testPhotosUserFileDataItemHashState0080
     * @tc.desc      Builds hash for LOADED state sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0080 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_79', 480);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/79';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/790 180 false');
      expect(item.getHashCode() === '480').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_79');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0081
     * @tc.name      testPhotosUserFileDataItemHashState0081
     * @tc.desc      Builds hash for TRASHED state sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0081 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_80', 481);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/80';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/801 270 true');
      expect(item.getHashCode() === '481').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_80');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0082
     * @tc.name      testPhotosUserFileDataItemHashState0082
     * @tc.desc      Builds hash for PART_LOADED state sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0082 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_81', 482);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/81';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/810 0 false');
      expect(item.getHashCode() === '482').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_81');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0083
     * @tc.name      testPhotosUserFileDataItemHashState0083
     * @tc.desc      Builds hash for LOADED state sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0083 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_82', 483);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/82';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/821 90 true');
      expect(item.getHashCode() === '483').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_82');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0084
     * @tc.name      testPhotosUserFileDataItemHashState0084
     * @tc.desc      Builds hash for TRASHED state sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0084 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_83', 484);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/83';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/830 180 false');
      expect(item.getHashCode() === '484').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_83');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0085
     * @tc.name      testPhotosUserFileDataItemHashState0085
     * @tc.desc      Builds hash for PART_LOADED state sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0085 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_84', 485);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/84';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/841 270 true');
      expect(item.getHashCode() === '485').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_84');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0086
     * @tc.name      testPhotosUserFileDataItemHashState0086
     * @tc.desc      Builds hash for LOADED state sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0086 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_85', 486);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/85';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/850 0 false');
      expect(item.getHashCode() === '486').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_85');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0087
     * @tc.name      testPhotosUserFileDataItemHashState0087
     * @tc.desc      Builds hash for TRASHED state sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0087 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_86', 487);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/86';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/861 90 true');
      expect(item.getHashCode() === '487').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_86');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0088
     * @tc.name      testPhotosUserFileDataItemHashState0088
     * @tc.desc      Builds hash for PART_LOADED state sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0088 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_87', 488);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/87';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/870 180 false');
      expect(item.getHashCode() === '488').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_87');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0089
     * @tc.name      testPhotosUserFileDataItemHashState0089
     * @tc.desc      Builds hash for LOADED state sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0089 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_88', 489);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/88';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/881 270 true');
      expect(item.getHashCode() === '489').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_88');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0090
     * @tc.name      testPhotosUserFileDataItemHashState0090
     * @tc.desc      Builds hash for TRASHED state sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0090 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_89', 490);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/89';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/890 0 false');
      expect(item.getHashCode() === '490').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_89');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0091
     * @tc.name      testPhotosUserFileDataItemHashState0091
     * @tc.desc      Builds hash for PART_LOADED state sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0091 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_90', 491);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/90';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/901 90 true');
      expect(item.getHashCode() === '491').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0092
     * @tc.name      testPhotosUserFileDataItemHashState0092
     * @tc.desc      Builds hash for LOADED state sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0092 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_91', 492);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/91';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/910 180 false');
      expect(item.getHashCode() === '492').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_91');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0093
     * @tc.name      testPhotosUserFileDataItemHashState0093
     * @tc.desc      Builds hash for TRASHED state sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0093 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_92', 493);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/92';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/921 270 true');
      expect(item.getHashCode() === '493').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_92');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0094
     * @tc.name      testPhotosUserFileDataItemHashState0094
     * @tc.desc      Builds hash for PART_LOADED state sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0094 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_93', 494);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/93';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/930 0 false');
      expect(item.getHashCode() === '494').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_93');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0095
     * @tc.name      testPhotosUserFileDataItemHashState0095
     * @tc.desc      Builds hash for LOADED state sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0095 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_94', 495);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/94';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/941 90 true');
      expect(item.getHashCode() === '495').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_94');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0096
     * @tc.name      testPhotosUserFileDataItemHashState0096
     * @tc.desc      Builds hash for TRASHED state sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0096 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_95', 496);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/95';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/950 180 false');
      expect(item.getHashCode() === '496').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_95');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0097
     * @tc.name      testPhotosUserFileDataItemHashState0097
     * @tc.desc      Builds hash for PART_LOADED state sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0097 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_96', 497);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/96';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/961 270 true');
      expect(item.getHashCode() === '497').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_96');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0098
     * @tc.name      testPhotosUserFileDataItemHashState0098
     * @tc.desc      Builds hash for LOADED state sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0098 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_97', 498);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/state/97';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/970 0 false');
      expect(item.getHashCode() === '498').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_97');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0099
     * @tc.name      testPhotosUserFileDataItemHashState0099
     * @tc.desc      Builds hash for TRASHED state sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0099 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_98', 499);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/state/98';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/state/981 90 true');
      expect(item.getHashCode() === '499').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_98');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_STATE_0100
     * @tc.name      testPhotosUserFileDataItemHashState0100
     * @tc.desc      Builds hash for PART_LOADED state sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashState0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0100 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'state_device_99', 500);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/state/99';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/state/990 180 false');
      expect(item.getHashCode() === '500').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('state_device_99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashState0100 end');
    })
  })
}
