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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0004 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0005 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0006 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0007 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0008 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0009 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0011 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0012 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0012 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0013 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0013 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0014 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0014 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0015 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0015 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0016 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0016 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0017 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0017 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0018 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0019 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0019 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0020 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0020 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0021 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0021 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0022 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0022 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0023 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0023 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0024 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0024 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0025 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0025 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0026 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0026 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0027 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0027 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0028 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0028 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0029 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0029 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0030 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0030 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0031 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0031 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0032 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0032 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0033 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0033 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0034 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0034 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0035 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0035 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0036 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0036 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0037 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0037 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0038 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0038 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0039 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0039 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0040 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0040 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0041 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0041 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0042 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0042 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0043 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0043 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0044 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0044 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0045 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0046
     * @tc.name      testPhotosUserFileDataItemHashBoundary0046
     * @tc.desc      Builds boundary hash sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_45', 1045);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/45';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/450 90 true');
      expect(item.getHashCode() === '1045').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0047
     * @tc.name      testPhotosUserFileDataItemHashBoundary0047
     * @tc.desc      Builds boundary hash sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_46', 1046);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/46';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/461 180 false');
      expect(item.getHashCode() === '1046').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0048
     * @tc.name      testPhotosUserFileDataItemHashBoundary0048
     * @tc.desc      Builds boundary hash sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_47', 1047);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/47';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/470 270 false');
      expect(item.getHashCode() === '1047').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0049
     * @tc.name      testPhotosUserFileDataItemHashBoundary0049
     * @tc.desc      Builds boundary hash sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_48', 1048);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/48';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/481 0 true');
      expect(item.getHashCode() === '1048').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0050
     * @tc.name      testPhotosUserFileDataItemHashBoundary0050
     * @tc.desc      Builds boundary hash sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_49', 1049);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/49';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/490 90 false');
      expect(item.getHashCode() === '1049').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0051
     * @tc.name      testPhotosUserFileDataItemHashBoundary0051
     * @tc.desc      Builds boundary hash sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_50', 1050);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/50';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/501 180 false');
      expect(item.getHashCode() === '1050').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0052
     * @tc.name      testPhotosUserFileDataItemHashBoundary0052
     * @tc.desc      Builds boundary hash sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_51', 1051);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/51';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/510 270 true');
      expect(item.getHashCode() === '1051').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0053
     * @tc.name      testPhotosUserFileDataItemHashBoundary0053
     * @tc.desc      Builds boundary hash sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_52', 1052);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/52';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/521 0 false');
      expect(item.getHashCode() === '1052').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0054
     * @tc.name      testPhotosUserFileDataItemHashBoundary0054
     * @tc.desc      Builds boundary hash sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_53', 1053);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/53';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/530 90 false');
      expect(item.getHashCode() === '1053').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0055
     * @tc.name      testPhotosUserFileDataItemHashBoundary0055
     * @tc.desc      Builds boundary hash sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_54', 1054);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/54';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/541 180 true');
      expect(item.getHashCode() === '1054').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0056
     * @tc.name      testPhotosUserFileDataItemHashBoundary0056
     * @tc.desc      Builds boundary hash sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_55', 1055);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/55';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/550 270 false');
      expect(item.getHashCode() === '1055').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0057
     * @tc.name      testPhotosUserFileDataItemHashBoundary0057
     * @tc.desc      Builds boundary hash sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_56', 1056);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/56';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/561 0 false');
      expect(item.getHashCode() === '1056').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0058
     * @tc.name      testPhotosUserFileDataItemHashBoundary0058
     * @tc.desc      Builds boundary hash sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_57', 1057);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/57';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/570 90 true');
      expect(item.getHashCode() === '1057').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0059
     * @tc.name      testPhotosUserFileDataItemHashBoundary0059
     * @tc.desc      Builds boundary hash sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_58', 1058);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/58';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/581 180 false');
      expect(item.getHashCode() === '1058').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0060
     * @tc.name      testPhotosUserFileDataItemHashBoundary0060
     * @tc.desc      Builds boundary hash sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_59', 1059);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/59';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/590 270 false');
      expect(item.getHashCode() === '1059').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0061
     * @tc.name      testPhotosUserFileDataItemHashBoundary0061
     * @tc.desc      Builds boundary hash sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0061 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_60', 1060);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/60';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/601 0 true');
      expect(item.getHashCode() === '1060').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_60');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0062
     * @tc.name      testPhotosUserFileDataItemHashBoundary0062
     * @tc.desc      Builds boundary hash sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0062 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_61', 1061);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/61';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/610 90 false');
      expect(item.getHashCode() === '1061').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_61');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0063
     * @tc.name      testPhotosUserFileDataItemHashBoundary0063
     * @tc.desc      Builds boundary hash sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0063 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_62', 1062);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/62';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/621 180 false');
      expect(item.getHashCode() === '1062').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_62');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0064
     * @tc.name      testPhotosUserFileDataItemHashBoundary0064
     * @tc.desc      Builds boundary hash sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0064 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_63', 1063);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/63';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/630 270 true');
      expect(item.getHashCode() === '1063').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_63');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0065
     * @tc.name      testPhotosUserFileDataItemHashBoundary0065
     * @tc.desc      Builds boundary hash sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0065 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_64', 1064);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/64';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/641 0 false');
      expect(item.getHashCode() === '1064').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_64');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0066
     * @tc.name      testPhotosUserFileDataItemHashBoundary0066
     * @tc.desc      Builds boundary hash sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0066 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_65', 1065);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/65';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/650 90 false');
      expect(item.getHashCode() === '1065').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_65');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0067
     * @tc.name      testPhotosUserFileDataItemHashBoundary0067
     * @tc.desc      Builds boundary hash sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0067 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_66', 1066);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/66';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/661 180 true');
      expect(item.getHashCode() === '1066').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_66');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0068
     * @tc.name      testPhotosUserFileDataItemHashBoundary0068
     * @tc.desc      Builds boundary hash sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0068 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_67', 1067);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/67';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/670 270 false');
      expect(item.getHashCode() === '1067').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_67');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0069
     * @tc.name      testPhotosUserFileDataItemHashBoundary0069
     * @tc.desc      Builds boundary hash sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0069 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_68', 1068);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/68';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/681 0 false');
      expect(item.getHashCode() === '1068').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_68');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0070
     * @tc.name      testPhotosUserFileDataItemHashBoundary0070
     * @tc.desc      Builds boundary hash sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0070 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_69', 1069);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/69';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/690 90 true');
      expect(item.getHashCode() === '1069').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_69');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0071
     * @tc.name      testPhotosUserFileDataItemHashBoundary0071
     * @tc.desc      Builds boundary hash sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0071 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_70', 1070);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/70';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/701 180 false');
      expect(item.getHashCode() === '1070').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_70');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0072
     * @tc.name      testPhotosUserFileDataItemHashBoundary0072
     * @tc.desc      Builds boundary hash sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0072 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_71', 1071);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/71';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/710 270 false');
      expect(item.getHashCode() === '1071').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_71');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0073
     * @tc.name      testPhotosUserFileDataItemHashBoundary0073
     * @tc.desc      Builds boundary hash sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0073 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_72', 1072);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/72';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/721 0 true');
      expect(item.getHashCode() === '1072').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_72');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0074
     * @tc.name      testPhotosUserFileDataItemHashBoundary0074
     * @tc.desc      Builds boundary hash sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0074 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_73', 1073);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/73';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/730 90 false');
      expect(item.getHashCode() === '1073').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_73');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0075
     * @tc.name      testPhotosUserFileDataItemHashBoundary0075
     * @tc.desc      Builds boundary hash sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0075 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_74', 1074);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/74';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/741 180 false');
      expect(item.getHashCode() === '1074').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_74');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0076
     * @tc.name      testPhotosUserFileDataItemHashBoundary0076
     * @tc.desc      Builds boundary hash sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0076 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_75', 1075);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/75';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/750 270 true');
      expect(item.getHashCode() === '1075').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_75');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0077
     * @tc.name      testPhotosUserFileDataItemHashBoundary0077
     * @tc.desc      Builds boundary hash sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0077 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_76', 1076);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/76';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/761 0 false');
      expect(item.getHashCode() === '1076').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_76');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0078
     * @tc.name      testPhotosUserFileDataItemHashBoundary0078
     * @tc.desc      Builds boundary hash sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0078 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_77', 1077);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/77';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/770 90 false');
      expect(item.getHashCode() === '1077').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_77');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0079
     * @tc.name      testPhotosUserFileDataItemHashBoundary0079
     * @tc.desc      Builds boundary hash sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0079 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_78', 1078);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/78';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/781 180 true');
      expect(item.getHashCode() === '1078').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_78');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0080
     * @tc.name      testPhotosUserFileDataItemHashBoundary0080
     * @tc.desc      Builds boundary hash sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0080 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_79', 1079);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/79';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/790 270 false');
      expect(item.getHashCode() === '1079').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_79');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0081
     * @tc.name      testPhotosUserFileDataItemHashBoundary0081
     * @tc.desc      Builds boundary hash sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0081 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_80', 1080);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/80';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/801 0 false');
      expect(item.getHashCode() === '1080').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_80');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0082
     * @tc.name      testPhotosUserFileDataItemHashBoundary0082
     * @tc.desc      Builds boundary hash sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0082 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_81', 1081);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/81';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/810 90 true');
      expect(item.getHashCode() === '1081').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_81');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0083
     * @tc.name      testPhotosUserFileDataItemHashBoundary0083
     * @tc.desc      Builds boundary hash sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0083 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_82', 1082);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/82';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/821 180 false');
      expect(item.getHashCode() === '1082').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_82');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0084
     * @tc.name      testPhotosUserFileDataItemHashBoundary0084
     * @tc.desc      Builds boundary hash sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0084 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_83', 1083);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/83';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/830 270 false');
      expect(item.getHashCode() === '1083').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_83');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0085
     * @tc.name      testPhotosUserFileDataItemHashBoundary0085
     * @tc.desc      Builds boundary hash sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0085 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_84', 1084);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/84';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/841 0 true');
      expect(item.getHashCode() === '1084').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_84');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0086
     * @tc.name      testPhotosUserFileDataItemHashBoundary0086
     * @tc.desc      Builds boundary hash sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0086 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_85', 1085);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/85';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/850 90 false');
      expect(item.getHashCode() === '1085').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_85');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0087
     * @tc.name      testPhotosUserFileDataItemHashBoundary0087
     * @tc.desc      Builds boundary hash sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0087 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_86', 1086);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/86';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/861 180 false');
      expect(item.getHashCode() === '1086').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_86');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0088
     * @tc.name      testPhotosUserFileDataItemHashBoundary0088
     * @tc.desc      Builds boundary hash sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0088 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_87', 1087);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/87';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/870 270 true');
      expect(item.getHashCode() === '1087').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_87');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0089
     * @tc.name      testPhotosUserFileDataItemHashBoundary0089
     * @tc.desc      Builds boundary hash sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0089 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_88', 1088);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/88';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/881 0 false');
      expect(item.getHashCode() === '1088').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_88');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0090
     * @tc.name      testPhotosUserFileDataItemHashBoundary0090
     * @tc.desc      Builds boundary hash sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0090 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_89', 1089);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/89';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/890 90 false');
      expect(item.getHashCode() === '1089').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_89');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0091
     * @tc.name      testPhotosUserFileDataItemHashBoundary0091
     * @tc.desc      Builds boundary hash sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0091 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_90', 1090);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/90';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/901 180 true');
      expect(item.getHashCode() === '1090').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0092
     * @tc.name      testPhotosUserFileDataItemHashBoundary0092
     * @tc.desc      Builds boundary hash sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0092 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_91', 1091);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/91';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/910 270 false');
      expect(item.getHashCode() === '1091').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_91');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0093
     * @tc.name      testPhotosUserFileDataItemHashBoundary0093
     * @tc.desc      Builds boundary hash sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0093 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_92', 1092);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/92';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/921 0 false');
      expect(item.getHashCode() === '1092').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_92');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0094
     * @tc.name      testPhotosUserFileDataItemHashBoundary0094
     * @tc.desc      Builds boundary hash sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0094 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_93', 1093);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/93';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/930 90 true');
      expect(item.getHashCode() === '1093').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_93');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0095
     * @tc.name      testPhotosUserFileDataItemHashBoundary0095
     * @tc.desc      Builds boundary hash sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0095 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_94', 1094);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/94';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/941 180 false');
      expect(item.getHashCode() === '1094').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_94');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0096
     * @tc.name      testPhotosUserFileDataItemHashBoundary0096
     * @tc.desc      Builds boundary hash sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0096 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_95', 1095);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/95';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/950 270 false');
      expect(item.getHashCode() === '1095').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_95');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0097
     * @tc.name      testPhotosUserFileDataItemHashBoundary0097
     * @tc.desc      Builds boundary hash sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0097 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_96', 1096);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/96';
      item.favouriteStatus = 1;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/961 0 true');
      expect(item.getHashCode() === '1096').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_96');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0098
     * @tc.name      testPhotosUserFileDataItemHashBoundary0098
     * @tc.desc      Builds boundary hash sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0098 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_97', 1097);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/boundary/97';
      item.favouriteStatus = 0;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/970 90 false');
      expect(item.getHashCode() === '1097').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_97');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0099
     * @tc.name      testPhotosUserFileDataItemHashBoundary0099
     * @tc.desc      Builds boundary hash sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0099 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_98', 1098);
      item.status = MediaConstants.TRASHED;
      item.uri = 'file://media/boundary/98';
      item.favouriteStatus = 1;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/boundary/981 180 false');
      expect(item.getHashCode() === '1098').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_98');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0100
     * @tc.name      testPhotosUserFileDataItemHashBoundary0100
     * @tc.desc      Builds boundary hash sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0100 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'boundary_device_99', 1099);
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/boundary/99';
      item.favouriteStatus = 0;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/boundary/990 270 true');
      expect(item.getHashCode() === '1099').assertFalse();
      expect(item.isLoad()).assertTrue();
      expect(item.deviceId).assertEqual('boundary_device_99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0101
     * @tc.name      testPhotosUserFileDataItemHashBoundary0101
     * @tc.desc      Walks boundary hash transition sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0101 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_0', 1200);
      expect(item.getHashCode()).assertEqual('1200');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/0';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/00 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/01 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0102
     * @tc.name      testPhotosUserFileDataItemHashBoundary0102
     * @tc.desc      Walks boundary hash transition sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0102 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_1', 1201);
      expect(item.getHashCode()).assertEqual('1201');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/1';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/11 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/10 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0103
     * @tc.name      testPhotosUserFileDataItemHashBoundary0103
     * @tc.desc      Walks boundary hash transition sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0103 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_2', 1202);
      expect(item.getHashCode()).assertEqual('1202');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/2';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/20 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/21 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0104
     * @tc.name      testPhotosUserFileDataItemHashBoundary0104
     * @tc.desc      Walks boundary hash transition sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0104 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_3', 1203);
      expect(item.getHashCode()).assertEqual('1203');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/3';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/31 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/30 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0105
     * @tc.name      testPhotosUserFileDataItemHashBoundary0105
     * @tc.desc      Walks boundary hash transition sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0105 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_4', 1204);
      expect(item.getHashCode()).assertEqual('1204');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/4';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/40 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/41 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0105 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0106
     * @tc.name      testPhotosUserFileDataItemHashBoundary0106
     * @tc.desc      Walks boundary hash transition sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0106 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_5', 1205);
      expect(item.getHashCode()).assertEqual('1205');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/5';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/51 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/50 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0107
     * @tc.name      testPhotosUserFileDataItemHashBoundary0107
     * @tc.desc      Walks boundary hash transition sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0107 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_6', 1206);
      expect(item.getHashCode()).assertEqual('1206');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/6';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/60 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/61 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0108
     * @tc.name      testPhotosUserFileDataItemHashBoundary0108
     * @tc.desc      Walks boundary hash transition sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0108 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_7', 1207);
      expect(item.getHashCode()).assertEqual('1207');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/7';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/71 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/70 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0109
     * @tc.name      testPhotosUserFileDataItemHashBoundary0109
     * @tc.desc      Walks boundary hash transition sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0109 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_8', 1208);
      expect(item.getHashCode()).assertEqual('1208');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/8';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/80 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/81 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0110
     * @tc.name      testPhotosUserFileDataItemHashBoundary0110
     * @tc.desc      Walks boundary hash transition sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0110 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_9', 1209);
      expect(item.getHashCode()).assertEqual('1209');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/9';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/91 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/90 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0111
     * @tc.name      testPhotosUserFileDataItemHashBoundary0111
     * @tc.desc      Walks boundary hash transition sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0111 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_10', 1210);
      expect(item.getHashCode()).assertEqual('1210');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/10';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/100 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/101 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0112
     * @tc.name      testPhotosUserFileDataItemHashBoundary0112
     * @tc.desc      Walks boundary hash transition sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0112 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_11', 1211);
      expect(item.getHashCode()).assertEqual('1211');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/11';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/111 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/110 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0113
     * @tc.name      testPhotosUserFileDataItemHashBoundary0113
     * @tc.desc      Walks boundary hash transition sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0113 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_12', 1212);
      expect(item.getHashCode()).assertEqual('1212');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/12';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/120 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/121 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0114
     * @tc.name      testPhotosUserFileDataItemHashBoundary0114
     * @tc.desc      Walks boundary hash transition sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0114 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_13', 1213);
      expect(item.getHashCode()).assertEqual('1213');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/13';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/131 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/130 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0115
     * @tc.name      testPhotosUserFileDataItemHashBoundary0115
     * @tc.desc      Walks boundary hash transition sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0115 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_14', 1214);
      expect(item.getHashCode()).assertEqual('1214');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/14';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/140 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/141 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0116
     * @tc.name      testPhotosUserFileDataItemHashBoundary0116
     * @tc.desc      Walks boundary hash transition sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0116 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_15', 1215);
      expect(item.getHashCode()).assertEqual('1215');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/15';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/151 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/150 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0117
     * @tc.name      testPhotosUserFileDataItemHashBoundary0117
     * @tc.desc      Walks boundary hash transition sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0117 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_16', 1216);
      expect(item.getHashCode()).assertEqual('1216');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/16';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/160 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/161 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0118
     * @tc.name      testPhotosUserFileDataItemHashBoundary0118
     * @tc.desc      Walks boundary hash transition sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0118 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_17', 1217);
      expect(item.getHashCode()).assertEqual('1217');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/17';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/171 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/170 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0119
     * @tc.name      testPhotosUserFileDataItemHashBoundary0119
     * @tc.desc      Walks boundary hash transition sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0119 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_18', 1218);
      expect(item.getHashCode()).assertEqual('1218');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/18';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/180 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/181 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0120
     * @tc.name      testPhotosUserFileDataItemHashBoundary0120
     * @tc.desc      Walks boundary hash transition sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0120 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_19', 1219);
      expect(item.getHashCode()).assertEqual('1219');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/19';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/191 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/190 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0120 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0121
     * @tc.name      testPhotosUserFileDataItemHashBoundary0121
     * @tc.desc      Walks boundary hash transition sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0121 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_20', 1220);
      expect(item.getHashCode()).assertEqual('1220');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/20';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/200 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/201 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0122
     * @tc.name      testPhotosUserFileDataItemHashBoundary0122
     * @tc.desc      Walks boundary hash transition sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0122 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_21', 1221);
      expect(item.getHashCode()).assertEqual('1221');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/21';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/211 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/210 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0123
     * @tc.name      testPhotosUserFileDataItemHashBoundary0123
     * @tc.desc      Walks boundary hash transition sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0123 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_22', 1222);
      expect(item.getHashCode()).assertEqual('1222');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/22';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/220 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/221 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0124
     * @tc.name      testPhotosUserFileDataItemHashBoundary0124
     * @tc.desc      Walks boundary hash transition sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0124 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_23', 1223);
      expect(item.getHashCode()).assertEqual('1223');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/23';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/231 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/230 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0125
     * @tc.name      testPhotosUserFileDataItemHashBoundary0125
     * @tc.desc      Walks boundary hash transition sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0125 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_24', 1224);
      expect(item.getHashCode()).assertEqual('1224');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/24';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/240 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/241 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0126
     * @tc.name      testPhotosUserFileDataItemHashBoundary0126
     * @tc.desc      Walks boundary hash transition sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0126 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_25', 1225);
      expect(item.getHashCode()).assertEqual('1225');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/25';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/251 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/250 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0127
     * @tc.name      testPhotosUserFileDataItemHashBoundary0127
     * @tc.desc      Walks boundary hash transition sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0127 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_26', 1226);
      expect(item.getHashCode()).assertEqual('1226');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/26';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/260 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/261 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0128
     * @tc.name      testPhotosUserFileDataItemHashBoundary0128
     * @tc.desc      Walks boundary hash transition sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0128 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_27', 1227);
      expect(item.getHashCode()).assertEqual('1227');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/27';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/271 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/270 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0129
     * @tc.name      testPhotosUserFileDataItemHashBoundary0129
     * @tc.desc      Walks boundary hash transition sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0129 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_28', 1228);
      expect(item.getHashCode()).assertEqual('1228');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/28';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/280 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/281 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0130
     * @tc.name      testPhotosUserFileDataItemHashBoundary0130
     * @tc.desc      Walks boundary hash transition sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0130 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_29', 1229);
      expect(item.getHashCode()).assertEqual('1229');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/29';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/291 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/290 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0131
     * @tc.name      testPhotosUserFileDataItemHashBoundary0131
     * @tc.desc      Walks boundary hash transition sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0131 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_30', 1230);
      expect(item.getHashCode()).assertEqual('1230');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/30';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/300 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/301 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0132
     * @tc.name      testPhotosUserFileDataItemHashBoundary0132
     * @tc.desc      Walks boundary hash transition sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0132 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_31', 1231);
      expect(item.getHashCode()).assertEqual('1231');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/31';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/311 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/310 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0133
     * @tc.name      testPhotosUserFileDataItemHashBoundary0133
     * @tc.desc      Walks boundary hash transition sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0133 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_32', 1232);
      expect(item.getHashCode()).assertEqual('1232');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/32';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/320 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/321 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0134
     * @tc.name      testPhotosUserFileDataItemHashBoundary0134
     * @tc.desc      Walks boundary hash transition sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0134 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_33', 1233);
      expect(item.getHashCode()).assertEqual('1233');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/33';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/331 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/330 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0135
     * @tc.name      testPhotosUserFileDataItemHashBoundary0135
     * @tc.desc      Walks boundary hash transition sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0135 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_34', 1234);
      expect(item.getHashCode()).assertEqual('1234');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/34';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/340 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/341 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0135 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0136
     * @tc.name      testPhotosUserFileDataItemHashBoundary0136
     * @tc.desc      Walks boundary hash transition sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0136 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_35', 1235);
      expect(item.getHashCode()).assertEqual('1235');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/35';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/351 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/350 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0137
     * @tc.name      testPhotosUserFileDataItemHashBoundary0137
     * @tc.desc      Walks boundary hash transition sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0137 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_36', 1236);
      expect(item.getHashCode()).assertEqual('1236');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/36';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/360 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/361 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0138
     * @tc.name      testPhotosUserFileDataItemHashBoundary0138
     * @tc.desc      Walks boundary hash transition sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0138 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_37', 1237);
      expect(item.getHashCode()).assertEqual('1237');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/37';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/371 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/370 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0139
     * @tc.name      testPhotosUserFileDataItemHashBoundary0139
     * @tc.desc      Walks boundary hash transition sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0139 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_38', 1238);
      expect(item.getHashCode()).assertEqual('1238');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/38';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/380 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/381 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0140
     * @tc.name      testPhotosUserFileDataItemHashBoundary0140
     * @tc.desc      Walks boundary hash transition sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0140 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_39', 1239);
      expect(item.getHashCode()).assertEqual('1239');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/39';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/391 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/390 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0141
     * @tc.name      testPhotosUserFileDataItemHashBoundary0141
     * @tc.desc      Walks boundary hash transition sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0141 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_40', 1240);
      expect(item.getHashCode()).assertEqual('1240');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/40';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/400 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/401 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0142
     * @tc.name      testPhotosUserFileDataItemHashBoundary0142
     * @tc.desc      Walks boundary hash transition sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0142 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_41', 1241);
      expect(item.getHashCode()).assertEqual('1241');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/41';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/411 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/410 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0143
     * @tc.name      testPhotosUserFileDataItemHashBoundary0143
     * @tc.desc      Walks boundary hash transition sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0143 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_42', 1242);
      expect(item.getHashCode()).assertEqual('1242');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/42';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/420 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/421 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0144
     * @tc.name      testPhotosUserFileDataItemHashBoundary0144
     * @tc.desc      Walks boundary hash transition sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0144 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_43', 1243);
      expect(item.getHashCode()).assertEqual('1243');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/43';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/431 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/430 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0145
     * @tc.name      testPhotosUserFileDataItemHashBoundary0145
     * @tc.desc      Walks boundary hash transition sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0145 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_44', 1244);
      expect(item.getHashCode()).assertEqual('1244');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/44';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/440 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/441 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0146
     * @tc.name      testPhotosUserFileDataItemHashBoundary0146
     * @tc.desc      Walks boundary hash transition sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0146 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_45', 1245);
      expect(item.getHashCode()).assertEqual('1245');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/45';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/451 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/450 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0147
     * @tc.name      testPhotosUserFileDataItemHashBoundary0147
     * @tc.desc      Walks boundary hash transition sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0147 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_46', 1246);
      expect(item.getHashCode()).assertEqual('1246');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/46';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/460 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/461 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0148
     * @tc.name      testPhotosUserFileDataItemHashBoundary0148
     * @tc.desc      Walks boundary hash transition sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0148 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_47', 1247);
      expect(item.getHashCode()).assertEqual('1247');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/47';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/471 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/470 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0149
     * @tc.name      testPhotosUserFileDataItemHashBoundary0149
     * @tc.desc      Walks boundary hash transition sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0149 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_48', 1248);
      expect(item.getHashCode()).assertEqual('1248');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/48';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/480 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/481 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0150
     * @tc.name      testPhotosUserFileDataItemHashBoundary0150
     * @tc.desc      Walks boundary hash transition sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0150 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_49', 1249);
      expect(item.getHashCode()).assertEqual('1249');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/49';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/491 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/490 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0150 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0151
     * @tc.name      testPhotosUserFileDataItemHashBoundary0151
     * @tc.desc      Walks boundary hash transition sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0151 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_50', 1250);
      expect(item.getHashCode()).assertEqual('1250');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/50';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/500 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/501 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0152
     * @tc.name      testPhotosUserFileDataItemHashBoundary0152
     * @tc.desc      Walks boundary hash transition sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0152 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_51', 1251);
      expect(item.getHashCode()).assertEqual('1251');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/51';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/511 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/510 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0153
     * @tc.name      testPhotosUserFileDataItemHashBoundary0153
     * @tc.desc      Walks boundary hash transition sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0153 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_52', 1252);
      expect(item.getHashCode()).assertEqual('1252');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/52';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/520 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/521 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0154
     * @tc.name      testPhotosUserFileDataItemHashBoundary0154
     * @tc.desc      Walks boundary hash transition sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0154 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_53', 1253);
      expect(item.getHashCode()).assertEqual('1253');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/53';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/531 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/530 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0155
     * @tc.name      testPhotosUserFileDataItemHashBoundary0155
     * @tc.desc      Walks boundary hash transition sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0155 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_54', 1254);
      expect(item.getHashCode()).assertEqual('1254');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/54';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/540 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/541 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0156
     * @tc.name      testPhotosUserFileDataItemHashBoundary0156
     * @tc.desc      Walks boundary hash transition sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0156 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_55', 1255);
      expect(item.getHashCode()).assertEqual('1255');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/55';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/551 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/550 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0157
     * @tc.name      testPhotosUserFileDataItemHashBoundary0157
     * @tc.desc      Walks boundary hash transition sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0157 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_56', 1256);
      expect(item.getHashCode()).assertEqual('1256');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/56';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/560 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/561 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0158
     * @tc.name      testPhotosUserFileDataItemHashBoundary0158
     * @tc.desc      Walks boundary hash transition sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0158 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_57', 1257);
      expect(item.getHashCode()).assertEqual('1257');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/57';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/571 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/570 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0159
     * @tc.name      testPhotosUserFileDataItemHashBoundary0159
     * @tc.desc      Walks boundary hash transition sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0159 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_58', 1258);
      expect(item.getHashCode()).assertEqual('1258');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/58';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/580 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/581 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0160
     * @tc.name      testPhotosUserFileDataItemHashBoundary0160
     * @tc.desc      Walks boundary hash transition sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0160 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_59', 1259);
      expect(item.getHashCode()).assertEqual('1259');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/59';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/591 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/590 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0161
     * @tc.name      testPhotosUserFileDataItemHashBoundary0161
     * @tc.desc      Walks boundary hash transition sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0161 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_60', 1260);
      expect(item.getHashCode()).assertEqual('1260');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/60';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/600 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/601 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0162
     * @tc.name      testPhotosUserFileDataItemHashBoundary0162
     * @tc.desc      Walks boundary hash transition sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0162 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_61', 1261);
      expect(item.getHashCode()).assertEqual('1261');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/61';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/611 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/610 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0163
     * @tc.name      testPhotosUserFileDataItemHashBoundary0163
     * @tc.desc      Walks boundary hash transition sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0163 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_62', 1262);
      expect(item.getHashCode()).assertEqual('1262');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/62';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/620 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/621 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0164
     * @tc.name      testPhotosUserFileDataItemHashBoundary0164
     * @tc.desc      Walks boundary hash transition sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0164 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_63', 1263);
      expect(item.getHashCode()).assertEqual('1263');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/63';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/631 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/630 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0165
     * @tc.name      testPhotosUserFileDataItemHashBoundary0165
     * @tc.desc      Walks boundary hash transition sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0165 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_64', 1264);
      expect(item.getHashCode()).assertEqual('1264');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/64';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/640 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/641 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0165 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0166
     * @tc.name      testPhotosUserFileDataItemHashBoundary0166
     * @tc.desc      Walks boundary hash transition sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0166 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_65', 1265);
      expect(item.getHashCode()).assertEqual('1265');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/65';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/651 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/650 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0167
     * @tc.name      testPhotosUserFileDataItemHashBoundary0167
     * @tc.desc      Walks boundary hash transition sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0167 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_66', 1266);
      expect(item.getHashCode()).assertEqual('1266');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/66';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/660 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/661 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0168
     * @tc.name      testPhotosUserFileDataItemHashBoundary0168
     * @tc.desc      Walks boundary hash transition sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0168 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_67', 1267);
      expect(item.getHashCode()).assertEqual('1267');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/67';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/671 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/670 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0169
     * @tc.name      testPhotosUserFileDataItemHashBoundary0169
     * @tc.desc      Walks boundary hash transition sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0169 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_68', 1268);
      expect(item.getHashCode()).assertEqual('1268');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/68';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/680 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/681 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0170
     * @tc.name      testPhotosUserFileDataItemHashBoundary0170
     * @tc.desc      Walks boundary hash transition sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0170 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_69', 1269);
      expect(item.getHashCode()).assertEqual('1269');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/69';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/691 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/690 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0171
     * @tc.name      testPhotosUserFileDataItemHashBoundary0171
     * @tc.desc      Walks boundary hash transition sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0171 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_70', 1270);
      expect(item.getHashCode()).assertEqual('1270');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/70';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/700 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/701 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0172
     * @tc.name      testPhotosUserFileDataItemHashBoundary0172
     * @tc.desc      Walks boundary hash transition sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0172 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_71', 1271);
      expect(item.getHashCode()).assertEqual('1271');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/71';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/711 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/710 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0173
     * @tc.name      testPhotosUserFileDataItemHashBoundary0173
     * @tc.desc      Walks boundary hash transition sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0173 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_72', 1272);
      expect(item.getHashCode()).assertEqual('1272');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/72';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/720 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/721 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0174
     * @tc.name      testPhotosUserFileDataItemHashBoundary0174
     * @tc.desc      Walks boundary hash transition sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0174 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_73', 1273);
      expect(item.getHashCode()).assertEqual('1273');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/73';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/731 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/730 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0175
     * @tc.name      testPhotosUserFileDataItemHashBoundary0175
     * @tc.desc      Walks boundary hash transition sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0175 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_74', 1274);
      expect(item.getHashCode()).assertEqual('1274');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/74';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/740 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/741 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0176
     * @tc.name      testPhotosUserFileDataItemHashBoundary0176
     * @tc.desc      Walks boundary hash transition sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0176 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_75', 1275);
      expect(item.getHashCode()).assertEqual('1275');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/75';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/751 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/750 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0177
     * @tc.name      testPhotosUserFileDataItemHashBoundary0177
     * @tc.desc      Walks boundary hash transition sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0177 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_76', 1276);
      expect(item.getHashCode()).assertEqual('1276');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/76';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/760 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/761 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0178
     * @tc.name      testPhotosUserFileDataItemHashBoundary0178
     * @tc.desc      Walks boundary hash transition sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0178 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_77', 1277);
      expect(item.getHashCode()).assertEqual('1277');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/77';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/771 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/770 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0179
     * @tc.name      testPhotosUserFileDataItemHashBoundary0179
     * @tc.desc      Walks boundary hash transition sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0179 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_78', 1278);
      expect(item.getHashCode()).assertEqual('1278');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/78';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/780 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/781 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0180
     * @tc.name      testPhotosUserFileDataItemHashBoundary0180
     * @tc.desc      Walks boundary hash transition sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0180 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_79', 1279);
      expect(item.getHashCode()).assertEqual('1279');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/79';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/791 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/790 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0180 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0181
     * @tc.name      testPhotosUserFileDataItemHashBoundary0181
     * @tc.desc      Walks boundary hash transition sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0181 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_80', 1280);
      expect(item.getHashCode()).assertEqual('1280');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/80';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/800 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/801 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0182
     * @tc.name      testPhotosUserFileDataItemHashBoundary0182
     * @tc.desc      Walks boundary hash transition sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0182 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_81', 1281);
      expect(item.getHashCode()).assertEqual('1281');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/81';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/811 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/810 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0183
     * @tc.name      testPhotosUserFileDataItemHashBoundary0183
     * @tc.desc      Walks boundary hash transition sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0183 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_82', 1282);
      expect(item.getHashCode()).assertEqual('1282');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/82';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/820 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/821 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0184
     * @tc.name      testPhotosUserFileDataItemHashBoundary0184
     * @tc.desc      Walks boundary hash transition sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0184 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_83', 1283);
      expect(item.getHashCode()).assertEqual('1283');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/83';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/831 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/830 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0185
     * @tc.name      testPhotosUserFileDataItemHashBoundary0185
     * @tc.desc      Walks boundary hash transition sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0185 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_84', 1284);
      expect(item.getHashCode()).assertEqual('1284');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/84';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/840 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/841 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0186
     * @tc.name      testPhotosUserFileDataItemHashBoundary0186
     * @tc.desc      Walks boundary hash transition sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0186 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_85', 1285);
      expect(item.getHashCode()).assertEqual('1285');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/85';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/851 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/850 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0187
     * @tc.name      testPhotosUserFileDataItemHashBoundary0187
     * @tc.desc      Walks boundary hash transition sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0187 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_86', 1286);
      expect(item.getHashCode()).assertEqual('1286');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/86';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/860 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/861 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0188
     * @tc.name      testPhotosUserFileDataItemHashBoundary0188
     * @tc.desc      Walks boundary hash transition sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0188 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_87', 1287);
      expect(item.getHashCode()).assertEqual('1287');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/87';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/871 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/870 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0189
     * @tc.name      testPhotosUserFileDataItemHashBoundary0189
     * @tc.desc      Walks boundary hash transition sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0189 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_88', 1288);
      expect(item.getHashCode()).assertEqual('1288');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/88';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/880 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/881 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0190
     * @tc.name      testPhotosUserFileDataItemHashBoundary0190
     * @tc.desc      Walks boundary hash transition sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0190 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_89', 1289);
      expect(item.getHashCode()).assertEqual('1289');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/89';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/891 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/890 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0191
     * @tc.name      testPhotosUserFileDataItemHashBoundary0191
     * @tc.desc      Walks boundary hash transition sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0191 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_90', 1290);
      expect(item.getHashCode()).assertEqual('1290');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/90';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/900 180 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/901 180 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0192
     * @tc.name      testPhotosUserFileDataItemHashBoundary0192
     * @tc.desc      Walks boundary hash transition sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0192 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_91', 1291);
      expect(item.getHashCode()).assertEqual('1291');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/91';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/911 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/910 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0192 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0193
     * @tc.name      testPhotosUserFileDataItemHashBoundary0193
     * @tc.desc      Walks boundary hash transition sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0193 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_92', 1292);
      expect(item.getHashCode()).assertEqual('1292');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/92';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/920 0 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/921 0 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0194
     * @tc.name      testPhotosUserFileDataItemHashBoundary0194
     * @tc.desc      Walks boundary hash transition sample 94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0194 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_93', 1293);
      expect(item.getHashCode()).assertEqual('1293');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/93';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/931 90 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/930 90 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0195
     * @tc.name      testPhotosUserFileDataItemHashBoundary0195
     * @tc.desc      Walks boundary hash transition sample 95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0195 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_94', 1294);
      expect(item.getHashCode()).assertEqual('1294');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/94';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/940 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/941 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0195 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0196
     * @tc.name      testPhotosUserFileDataItemHashBoundary0196
     * @tc.desc      Walks boundary hash transition sample 96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0196 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_95', 1295);
      expect(item.getHashCode()).assertEqual('1295');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/95';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/951 270 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/950 270 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0197
     * @tc.name      testPhotosUserFileDataItemHashBoundary0197
     * @tc.desc      Walks boundary hash transition sample 97.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0197 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_96', 1296);
      expect(item.getHashCode()).assertEqual('1296');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/96';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/960 0 true');
      item.favouriteStatus = 1;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/961 0 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0198
     * @tc.name      testPhotosUserFileDataItemHashBoundary0198
     * @tc.desc      Walks boundary hash transition sample 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0198 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_97', 1297);
      expect(item.getHashCode()).assertEqual('1297');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/97';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/971 90 false');
      item.favouriteStatus = 0;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/970 90 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0199
     * @tc.name      testPhotosUserFileDataItemHashBoundary0199
     * @tc.desc      Walks boundary hash transition sample 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0199 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_98', 1298);
      expect(item.getHashCode()).assertEqual('1298');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/98';
      item.favouriteStatus = 0;
      item.orientation = 180;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/980 180 false');
      item.favouriteStatus = 1;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/981 180 true');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_HASH_BOUNDARY_0200
     * @tc.name      testPhotosUserFileDataItemHashBoundary0200
     * @tc.desc      Walks boundary hash transition sample 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHashBoundary0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0200 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], 'transition_device_99', 1299);
      expect(item.getHashCode()).assertEqual('1299');
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/transition/99';
      item.favouriteStatus = 1;
      item.orientation = 270;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/transition/991 270 true');
      item.favouriteStatus = 0;
      item.isSelect = false;
      expect(item.getHashCode()).assertEqual('file://media/transition/990 270 false');
      expect(item.isLoad()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHashBoundary0200 end');
    })
  })
}
