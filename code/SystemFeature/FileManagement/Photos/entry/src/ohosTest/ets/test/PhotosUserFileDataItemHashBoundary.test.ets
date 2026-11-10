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

const TAG = '[Sample_PhotosUserFileDataItemHashBoundaryTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemHashBoundaryTest(): void {
  describe('PhotosUserFileDataItemHashBoundaryTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0001
     * @tc.name      testPhotosUserFileDataItemHashBoundary0001
     * @tc.desc      Builds boundary hash sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_0', 1000);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/0';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/01 0 true');
      expect(item.getHashCode() === '1000').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_0');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0002
     * @tc.name      testPhotosUserFileDataItemHashBoundary0002
     * @tc.desc      Builds boundary hash sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_1', 1001);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/1';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/10 90 false');
      expect(item.getHashCode() === '1001').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_1');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0003
     * @tc.name      testPhotosUserFileDataItemHashBoundary0003
     * @tc.desc      Builds boundary hash sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_2', 1002);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/2';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/21 180 false');
      expect(item.getHashCode() === '1002').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_2');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0004
     * @tc.name      testPhotosUserFileDataItemHashBoundary0004
     * @tc.desc      Builds boundary hash sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_3', 1003);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/3';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/30 270 true');
      expect(item.getHashCode() === '1003').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_3');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0005
     * @tc.name      testPhotosUserFileDataItemHashBoundary0005
     * @tc.desc      Builds boundary hash sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_4', 1004);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/4';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/41 0 false');
      expect(item.getHashCode() === '1004').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_4');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0006
     * @tc.name      testPhotosUserFileDataItemHashBoundary0006
     * @tc.desc      Builds boundary hash sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_5', 1005);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/5';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/50 90 false');
      expect(item.getHashCode() === '1005').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_5');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0007
     * @tc.name      testPhotosUserFileDataItemHashBoundary0007
     * @tc.desc      Builds boundary hash sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_6', 1006);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/6';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/61 180 true');
      expect(item.getHashCode() === '1006').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_6');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0008
     * @tc.name      testPhotosUserFileDataItemHashBoundary0008
     * @tc.desc      Builds boundary hash sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_7', 1007);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/7';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/70 270 false');
      expect(item.getHashCode() === '1007').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_7');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0009
     * @tc.name      testPhotosUserFileDataItemHashBoundary0009
     * @tc.desc      Builds boundary hash sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_8', 1008);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/8';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/81 0 false');
      expect(item.getHashCode() === '1008').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_8');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0010
     * @tc.name      testPhotosUserFileDataItemHashBoundary0010
     * @tc.desc      Builds boundary hash sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_9', 1009);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/9';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/90 90 true');
      expect(item.getHashCode() === '1009').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_9');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0011
     * @tc.name      testPhotosUserFileDataItemHashBoundary0011
     * @tc.desc      Builds boundary hash sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_10', 1010);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/10';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/101 180 false');
      expect(item.getHashCode() === '1010').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0012
     * @tc.name      testPhotosUserFileDataItemHashBoundary0012
     * @tc.desc      Builds boundary hash sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_11', 1011);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/11';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/110 270 false');
      expect(item.getHashCode() === '1011').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0013
     * @tc.name      testPhotosUserFileDataItemHashBoundary0013
     * @tc.desc      Builds boundary hash sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_12', 1012);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/12';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/121 0 true');
      expect(item.getHashCode() === '1012').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0014
     * @tc.name      testPhotosUserFileDataItemHashBoundary0014
     * @tc.desc      Builds boundary hash sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_13', 1013);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/13';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/130 90 false');
      expect(item.getHashCode() === '1013').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0015
     * @tc.name      testPhotosUserFileDataItemHashBoundary0015
     * @tc.desc      Builds boundary hash sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_14', 1014);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/14';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/141 180 false');
      expect(item.getHashCode() === '1014').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0016
     * @tc.name      testPhotosUserFileDataItemHashBoundary0016
     * @tc.desc      Builds boundary hash sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_15', 1015);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/15';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/150 270 true');
      expect(item.getHashCode() === '1015').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0017
     * @tc.name      testPhotosUserFileDataItemHashBoundary0017
     * @tc.desc      Builds boundary hash sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_16', 1016);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/16';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/161 0 false');
      expect(item.getHashCode() === '1016').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0018
     * @tc.name      testPhotosUserFileDataItemHashBoundary0018
     * @tc.desc      Builds boundary hash sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_17', 1017);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/17';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/170 90 false');
      expect(item.getHashCode() === '1017').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0019
     * @tc.name      testPhotosUserFileDataItemHashBoundary0019
     * @tc.desc      Builds boundary hash sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_18', 1018);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/18';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/181 180 true');
      expect(item.getHashCode() === '1018').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0020
     * @tc.name      testPhotosUserFileDataItemHashBoundary0020
     * @tc.desc      Builds boundary hash sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_19', 1019);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/19';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/190 270 false');
      expect(item.getHashCode() === '1019').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0021
     * @tc.name      testPhotosUserFileDataItemHashBoundary0021
     * @tc.desc      Builds boundary hash sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_20', 1020);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/20';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/201 0 false');
      expect(item.getHashCode() === '1020').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0022
     * @tc.name      testPhotosUserFileDataItemHashBoundary0022
     * @tc.desc      Builds boundary hash sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_21', 1021);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/21';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/210 90 true');
      expect(item.getHashCode() === '1021').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0023
     * @tc.name      testPhotosUserFileDataItemHashBoundary0023
     * @tc.desc      Builds boundary hash sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_22', 1022);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/22';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/221 180 false');
      expect(item.getHashCode() === '1022').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0024
     * @tc.name      testPhotosUserFileDataItemHashBoundary0024
     * @tc.desc      Builds boundary hash sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_23', 1023);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/23';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/230 270 false');
      expect(item.getHashCode() === '1023').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0025
     * @tc.name      testPhotosUserFileDataItemHashBoundary0025
     * @tc.desc      Builds boundary hash sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_24', 1024);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/24';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/241 0 true');
      expect(item.getHashCode() === '1024').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0026
     * @tc.name      testPhotosUserFileDataItemHashBoundary0026
     * @tc.desc      Builds boundary hash sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_25', 1025);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/25';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/250 90 false');
      expect(item.getHashCode() === '1025').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0027
     * @tc.name      testPhotosUserFileDataItemHashBoundary0027
     * @tc.desc      Builds boundary hash sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_26', 1026);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/26';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/261 180 false');
      expect(item.getHashCode() === '1026').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0028
     * @tc.name      testPhotosUserFileDataItemHashBoundary0028
     * @tc.desc      Builds boundary hash sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_27', 1027);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/27';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/270 270 true');
      expect(item.getHashCode() === '1027').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0029
     * @tc.name      testPhotosUserFileDataItemHashBoundary0029
     * @tc.desc      Builds boundary hash sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_28', 1028);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/28';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/281 0 false');
      expect(item.getHashCode() === '1028').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0030
     * @tc.name      testPhotosUserFileDataItemHashBoundary0030
     * @tc.desc      Builds boundary hash sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_29', 1029);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/29';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/290 90 false');
      expect(item.getHashCode() === '1029').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0031
     * @tc.name      testPhotosUserFileDataItemHashBoundary0031
     * @tc.desc      Builds boundary hash sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_30', 1030);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/30';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/301 180 true');
      expect(item.getHashCode() === '1030').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0032
     * @tc.name      testPhotosUserFileDataItemHashBoundary0032
     * @tc.desc      Builds boundary hash sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_31', 1031);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/31';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/310 270 false');
      expect(item.getHashCode() === '1031').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0033
     * @tc.name      testPhotosUserFileDataItemHashBoundary0033
     * @tc.desc      Builds boundary hash sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_32', 1032);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/32';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/321 0 false');
      expect(item.getHashCode() === '1032').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0034
     * @tc.name      testPhotosUserFileDataItemHashBoundary0034
     * @tc.desc      Builds boundary hash sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_33', 1033);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/33';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/330 90 true');
      expect(item.getHashCode() === '1033').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0035
     * @tc.name      testPhotosUserFileDataItemHashBoundary0035
     * @tc.desc      Builds boundary hash sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_34', 1034);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/34';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/341 180 false');
      expect(item.getHashCode() === '1034').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0036
     * @tc.name      testPhotosUserFileDataItemHashBoundary0036
     * @tc.desc      Builds boundary hash sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_35', 1035);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/35';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/350 270 false');
      expect(item.getHashCode() === '1035').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_35');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0037
     * @tc.name      testPhotosUserFileDataItemHashBoundary0037
     * @tc.desc      Builds boundary hash sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_36', 1036);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/36';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/361 0 true');
      expect(item.getHashCode() === '1036').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0038
     * @tc.name      testPhotosUserFileDataItemHashBoundary0038
     * @tc.desc      Builds boundary hash sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_37', 1037);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/37';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/370 90 false');
      expect(item.getHashCode() === '1037').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0039
     * @tc.name      testPhotosUserFileDataItemHashBoundary0039
     * @tc.desc      Builds boundary hash sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_38', 1038);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/38';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/381 180 false');
      expect(item.getHashCode() === '1038').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0040
     * @tc.name      testPhotosUserFileDataItemHashBoundary0040
     * @tc.desc      Builds boundary hash sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_39', 1039);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/39';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/390 270 true');
      expect(item.getHashCode() === '1039').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0041
     * @tc.name      testPhotosUserFileDataItemHashBoundary0041
     * @tc.desc      Builds boundary hash sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_40', 1040);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/40';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/401 0 false');
      expect(item.getHashCode() === '1040').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0042
     * @tc.name      testPhotosUserFileDataItemHashBoundary0042
     * @tc.desc      Builds boundary hash sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_41', 1041);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/41';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/410 90 false');
      expect(item.getHashCode() === '1041').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0043
     * @tc.name      testPhotosUserFileDataItemHashBoundary0043
     * @tc.desc      Builds boundary hash sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_42', 1042);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/42';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/421 180 true');
      expect(item.getHashCode() === '1042').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0044
     * @tc.name      testPhotosUserFileDataItemHashBoundary0044
     * @tc.desc      Builds boundary hash sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_43', 1043);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/43';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/430 270 false');
      expect(item.getHashCode() === '1043').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0045
     * @tc.name      testPhotosUserFileDataItemHashBoundary0045
     * @tc.desc      Builds boundary hash sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_44', 1044);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/44';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/441 0 false');
      expect(item.getHashCode() === '1044').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0046
     * @tc.name      testPhotosUserFileDataItemHashBoundary0046
