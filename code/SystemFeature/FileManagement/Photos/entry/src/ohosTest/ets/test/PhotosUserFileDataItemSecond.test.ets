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

const TAG = '[Sample_PhotosUserFileDataItemSecondTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemSecondTest(): void {
  describe('PhotosUserFileDataItemSecondTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0001
     * @tc.name      testPhotosUserFileDataItemSecond0001
     * @tc.desc      Initializes second media item sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_0', ['s_a_0', 's_b_0'], 'second_device_0', 501);
      expect(item.selections).assertEqual('second_0');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_0');
      expect(item.index).assertEqual(501);
      expect(item.hashIndex).assertEqual(501);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0002
     * @tc.name      testPhotosUserFileDataItemSecond0002
     * @tc.desc      Initializes second media item sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_1', ['s_a_1', 's_b_1'], 'second_device_1', 502);
      expect(item.selections).assertEqual('second_1');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_1');
      expect(item.index).assertEqual(502);
      expect(item.hashIndex).assertEqual(502);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0003
     * @tc.name      testPhotosUserFileDataItemSecond0003
     * @tc.desc      Initializes second media item sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_2', ['s_a_2', 's_b_2'], 'second_device_2', 503);
      expect(item.selections).assertEqual('second_2');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_2');
      expect(item.index).assertEqual(503);
      expect(item.hashIndex).assertEqual(503);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0004
     * @tc.name      testPhotosUserFileDataItemSecond0004
     * @tc.desc      Initializes second media item sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_3', ['s_a_3', 's_b_3'], 'second_device_3', 504);
      expect(item.selections).assertEqual('second_3');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_3');
      expect(item.index).assertEqual(504);
      expect(item.hashIndex).assertEqual(504);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0005
     * @tc.name      testPhotosUserFileDataItemSecond0005
     * @tc.desc      Initializes second media item sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0005 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_4', ['s_a_4', 's_b_4'], 'second_device_4', 505);
      expect(item.selections).assertEqual('second_4');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_4');
      expect(item.index).assertEqual(505);
      expect(item.hashIndex).assertEqual(505);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0006
     * @tc.name      testPhotosUserFileDataItemSecond0006
     * @tc.desc      Initializes second media item sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0006 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_5', ['s_a_5', 's_b_5'], 'second_device_5', 506);
      expect(item.selections).assertEqual('second_5');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_5');
      expect(item.index).assertEqual(506);
      expect(item.hashIndex).assertEqual(506);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0007
     * @tc.name      testPhotosUserFileDataItemSecond0007
     * @tc.desc      Initializes second media item sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0007 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_6', ['s_a_6', 's_b_6'], 'second_device_6', 507);
      expect(item.selections).assertEqual('second_6');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_6');
      expect(item.index).assertEqual(507);
      expect(item.hashIndex).assertEqual(507);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0008
     * @tc.name      testPhotosUserFileDataItemSecond0008
     * @tc.desc      Initializes second media item sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0008 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_7', ['s_a_7', 's_b_7'], 'second_device_7', 508);
      expect(item.selections).assertEqual('second_7');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_7');
      expect(item.index).assertEqual(508);
      expect(item.hashIndex).assertEqual(508);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0009
     * @tc.name      testPhotosUserFileDataItemSecond0009
     * @tc.desc      Initializes second media item sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0009 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_8', ['s_a_8', 's_b_8'], 'second_device_8', 509);
      expect(item.selections).assertEqual('second_8');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_8');
      expect(item.index).assertEqual(509);
      expect(item.hashIndex).assertEqual(509);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0010
     * @tc.name      testPhotosUserFileDataItemSecond0010
     * @tc.desc      Initializes second media item sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0010 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_9', ['s_a_9', 's_b_9'], 'second_device_9', 510);
      expect(item.selections).assertEqual('second_9');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_9');
      expect(item.index).assertEqual(510);
      expect(item.hashIndex).assertEqual(510);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0011
     * @tc.name      testPhotosUserFileDataItemSecond0011
     * @tc.desc      Initializes second media item sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0011 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_10', ['s_a_10', 's_b_10'], 'second_device_10', 511);
      expect(item.selections).assertEqual('second_10');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_10');
      expect(item.index).assertEqual(511);
      expect(item.hashIndex).assertEqual(511);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0012
     * @tc.name      testPhotosUserFileDataItemSecond0012
     * @tc.desc      Initializes second media item sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0012 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_11', ['s_a_11', 's_b_11'], 'second_device_11', 512);
      expect(item.selections).assertEqual('second_11');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_11');
      expect(item.index).assertEqual(512);
      expect(item.hashIndex).assertEqual(512);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0013
     * @tc.name      testPhotosUserFileDataItemSecond0013
     * @tc.desc      Initializes second media item sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0013 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_12', ['s_a_12', 's_b_12'], 'second_device_12', 513);
      expect(item.selections).assertEqual('second_12');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_12');
      expect(item.index).assertEqual(513);
      expect(item.hashIndex).assertEqual(513);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0014
     * @tc.name      testPhotosUserFileDataItemSecond0014
     * @tc.desc      Initializes second media item sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0014 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_13', ['s_a_13', 's_b_13'], 'second_device_13', 514);
      expect(item.selections).assertEqual('second_13');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_13');
      expect(item.index).assertEqual(514);
      expect(item.hashIndex).assertEqual(514);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0015
     * @tc.name      testPhotosUserFileDataItemSecond0015
     * @tc.desc      Initializes second media item sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0015 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_14', ['s_a_14', 's_b_14'], 'second_device_14', 515);
      expect(item.selections).assertEqual('second_14');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_14');
      expect(item.index).assertEqual(515);
      expect(item.hashIndex).assertEqual(515);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0016
     * @tc.name      testPhotosUserFileDataItemSecond0016
     * @tc.desc      Initializes second media item sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0016 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_15', ['s_a_15', 's_b_15'], 'second_device_15', 516);
      expect(item.selections).assertEqual('second_15');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_15');
      expect(item.index).assertEqual(516);
      expect(item.hashIndex).assertEqual(516);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0017
     * @tc.name      testPhotosUserFileDataItemSecond0017
     * @tc.desc      Initializes second media item sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0017 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_16', ['s_a_16', 's_b_16'], 'second_device_16', 517);
      expect(item.selections).assertEqual('second_16');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_16');
      expect(item.index).assertEqual(517);
      expect(item.hashIndex).assertEqual(517);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0018
     * @tc.name      testPhotosUserFileDataItemSecond0018
     * @tc.desc      Initializes second media item sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0018 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_17', ['s_a_17', 's_b_17'], 'second_device_17', 518);
      expect(item.selections).assertEqual('second_17');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_17');
      expect(item.index).assertEqual(518);
      expect(item.hashIndex).assertEqual(518);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0019
     * @tc.name      testPhotosUserFileDataItemSecond0019
     * @tc.desc      Initializes second media item sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0019 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_18', ['s_a_18', 's_b_18'], 'second_device_18', 519);
      expect(item.selections).assertEqual('second_18');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_18');
      expect(item.index).assertEqual(519);
      expect(item.hashIndex).assertEqual(519);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0020
     * @tc.name      testPhotosUserFileDataItemSecond0020
     * @tc.desc      Initializes second media item sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0020 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_19', ['s_a_19', 's_b_19'], 'second_device_19', 520);
      expect(item.selections).assertEqual('second_19');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_19');
      expect(item.index).assertEqual(520);
      expect(item.hashIndex).assertEqual(520);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0021
     * @tc.name      testPhotosUserFileDataItemSecond0021
     * @tc.desc      Initializes second media item sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0021 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_20', ['s_a_20', 's_b_20'], 'second_device_20', 521);
      expect(item.selections).assertEqual('second_20');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_20');
      expect(item.index).assertEqual(521);
      expect(item.hashIndex).assertEqual(521);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0022
     * @tc.name      testPhotosUserFileDataItemSecond0022
     * @tc.desc      Initializes second media item sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0022 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_21', ['s_a_21', 's_b_21'], 'second_device_21', 522);
      expect(item.selections).assertEqual('second_21');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_21');
      expect(item.index).assertEqual(522);
      expect(item.hashIndex).assertEqual(522);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0023
     * @tc.name      testPhotosUserFileDataItemSecond0023
     * @tc.desc      Initializes second media item sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0023 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_22', ['s_a_22', 's_b_22'], 'second_device_22', 523);
      expect(item.selections).assertEqual('second_22');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_22');
      expect(item.index).assertEqual(523);
      expect(item.hashIndex).assertEqual(523);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0024
     * @tc.name      testPhotosUserFileDataItemSecond0024
     * @tc.desc      Initializes second media item sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0024 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_23', ['s_a_23', 's_b_23'], 'second_device_23', 524);
      expect(item.selections).assertEqual('second_23');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_23');
      expect(item.index).assertEqual(524);
      expect(item.hashIndex).assertEqual(524);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0025
     * @tc.name      testPhotosUserFileDataItemSecond0025
     * @tc.desc      Initializes second media item sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0025 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_24', ['s_a_24', 's_b_24'], 'second_device_24', 525);
      expect(item.selections).assertEqual('second_24');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_24');
      expect(item.index).assertEqual(525);
      expect(item.hashIndex).assertEqual(525);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0026
     * @tc.name      testPhotosUserFileDataItemSecond0026
     * @tc.desc      Initializes second media item sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0026 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_25', ['s_a_25', 's_b_25'], 'second_device_25', 526);
      expect(item.selections).assertEqual('second_25');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_25');
      expect(item.index).assertEqual(526);
      expect(item.hashIndex).assertEqual(526);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0027
     * @tc.name      testPhotosUserFileDataItemSecond0027
     * @tc.desc      Initializes second media item sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0027 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_26', ['s_a_26', 's_b_26'], 'second_device_26', 527);
      expect(item.selections).assertEqual('second_26');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_26');
      expect(item.index).assertEqual(527);
      expect(item.hashIndex).assertEqual(527);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0028
     * @tc.name      testPhotosUserFileDataItemSecond0028
     * @tc.desc      Initializes second media item sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0028 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_27', ['s_a_27', 's_b_27'], 'second_device_27', 528);
      expect(item.selections).assertEqual('second_27');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_27');
      expect(item.index).assertEqual(528);
      expect(item.hashIndex).assertEqual(528);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0029
     * @tc.name      testPhotosUserFileDataItemSecond0029
     * @tc.desc      Initializes second media item sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0029 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_28', ['s_a_28', 's_b_28'], 'second_device_28', 529);
      expect(item.selections).assertEqual('second_28');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_28');
      expect(item.index).assertEqual(529);
      expect(item.hashIndex).assertEqual(529);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0030
     * @tc.name      testPhotosUserFileDataItemSecond0030
     * @tc.desc      Initializes second media item sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0030 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_29', ['s_a_29', 's_b_29'], 'second_device_29', 530);
      expect(item.selections).assertEqual('second_29');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_29');
      expect(item.index).assertEqual(530);
      expect(item.hashIndex).assertEqual(530);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0031
     * @tc.name      testPhotosUserFileDataItemSecond0031
     * @tc.desc      Initializes second media item sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0031 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_30', ['s_a_30', 's_b_30'], 'second_device_30', 531);
      expect(item.selections).assertEqual('second_30');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_30');
      expect(item.index).assertEqual(531);
      expect(item.hashIndex).assertEqual(531);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0032
     * @tc.name      testPhotosUserFileDataItemSecond0032
     * @tc.desc      Initializes second media item sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0032 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_31', ['s_a_31', 's_b_31'], 'second_device_31', 532);
      expect(item.selections).assertEqual('second_31');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_31');
      expect(item.index).assertEqual(532);
      expect(item.hashIndex).assertEqual(532);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0033
     * @tc.name      testPhotosUserFileDataItemSecond0033
     * @tc.desc      Initializes second media item sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0033 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_32', ['s_a_32', 's_b_32'], 'second_device_32', 533);
      expect(item.selections).assertEqual('second_32');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_32');
      expect(item.index).assertEqual(533);
      expect(item.hashIndex).assertEqual(533);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0034
     * @tc.name      testPhotosUserFileDataItemSecond0034
     * @tc.desc      Initializes second media item sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0034 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_33', ['s_a_33', 's_b_33'], 'second_device_33', 534);
      expect(item.selections).assertEqual('second_33');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_33');
      expect(item.index).assertEqual(534);
      expect(item.hashIndex).assertEqual(534);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0035
     * @tc.name      testPhotosUserFileDataItemSecond0035
     * @tc.desc      Initializes second media item sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0035 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_34', ['s_a_34', 's_b_34'], 'second_device_34', 535);
      expect(item.selections).assertEqual('second_34');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_34');
      expect(item.index).assertEqual(535);
      expect(item.hashIndex).assertEqual(535);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0036
     * @tc.name      testPhotosUserFileDataItemSecond0036
     * @tc.desc      Initializes second media item sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0036 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_35', ['s_a_35', 's_b_35'], 'second_device_35', 536);
      expect(item.selections).assertEqual('second_35');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_35');
      expect(item.index).assertEqual(536);
      expect(item.hashIndex).assertEqual(536);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0037
     * @tc.name      testPhotosUserFileDataItemSecond0037
     * @tc.desc      Initializes second media item sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0037 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_36', ['s_a_36', 's_b_36'], 'second_device_36', 537);
      expect(item.selections).assertEqual('second_36');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_36');
      expect(item.index).assertEqual(537);
      expect(item.hashIndex).assertEqual(537);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0038
     * @tc.name      testPhotosUserFileDataItemSecond0038
     * @tc.desc      Initializes second media item sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0038 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_37', ['s_a_37', 's_b_37'], 'second_device_37', 538);
      expect(item.selections).assertEqual('second_37');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_37');
      expect(item.index).assertEqual(538);
      expect(item.hashIndex).assertEqual(538);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0039
     * @tc.name      testPhotosUserFileDataItemSecond0039
     * @tc.desc      Initializes second media item sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0039 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_38', ['s_a_38', 's_b_38'], 'second_device_38', 539);
      expect(item.selections).assertEqual('second_38');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_38');
      expect(item.index).assertEqual(539);
      expect(item.hashIndex).assertEqual(539);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0040
     * @tc.name      testPhotosUserFileDataItemSecond0040
     * @tc.desc      Initializes second media item sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0040 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_39', ['s_a_39', 's_b_39'], 'second_device_39', 540);
      expect(item.selections).assertEqual('second_39');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_39');
      expect(item.index).assertEqual(540);
      expect(item.hashIndex).assertEqual(540);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0041
     * @tc.name      testPhotosUserFileDataItemSecond0041
     * @tc.desc      Initializes second media item sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0041 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_40', ['s_a_40', 's_b_40'], 'second_device_40', 541);
      expect(item.selections).assertEqual('second_40');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_40');
      expect(item.index).assertEqual(541);
      expect(item.hashIndex).assertEqual(541);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0042
     * @tc.name      testPhotosUserFileDataItemSecond0042
     * @tc.desc      Initializes second media item sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0042 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_41', ['s_a_41', 's_b_41'], 'second_device_41', 542);
      expect(item.selections).assertEqual('second_41');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_41');
      expect(item.index).assertEqual(542);
      expect(item.hashIndex).assertEqual(542);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0043
     * @tc.name      testPhotosUserFileDataItemSecond0043
     * @tc.desc      Initializes second media item sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0043 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_42', ['s_a_42', 's_b_42'], 'second_device_42', 543);
      expect(item.selections).assertEqual('second_42');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_42');
      expect(item.index).assertEqual(543);
      expect(item.hashIndex).assertEqual(543);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0044
     * @tc.name      testPhotosUserFileDataItemSecond0044
     * @tc.desc      Initializes second media item sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0044 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_43', ['s_a_43', 's_b_43'], 'second_device_43', 544);
      expect(item.selections).assertEqual('second_43');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_43');
      expect(item.index).assertEqual(544);
      expect(item.hashIndex).assertEqual(544);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0045
     * @tc.name      testPhotosUserFileDataItemSecond0045
     * @tc.desc      Initializes second media item sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0045 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_44', ['s_a_44', 's_b_44'], 'second_device_44', 545);
      expect(item.selections).assertEqual('second_44');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_44');
      expect(item.index).assertEqual(545);
      expect(item.hashIndex).assertEqual(545);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0046
     * @tc.name      testPhotosUserFileDataItemSecond0046
     * @tc.desc      Initializes second media item sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0046 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_45', ['s_a_45', 's_b_45'], 'second_device_45', 546);
      expect(item.selections).assertEqual('second_45');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_45');
      expect(item.index).assertEqual(546);
      expect(item.hashIndex).assertEqual(546);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0047
     * @tc.name      testPhotosUserFileDataItemSecond0047
     * @tc.desc      Initializes second media item sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0047 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_46', ['s_a_46', 's_b_46'], 'second_device_46', 547);
      expect(item.selections).assertEqual('second_46');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_46');
      expect(item.index).assertEqual(547);
      expect(item.hashIndex).assertEqual(547);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0048
     * @tc.name      testPhotosUserFileDataItemSecond0048
     * @tc.desc      Initializes second media item sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0048 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_47', ['s_a_47', 's_b_47'], 'second_device_47', 548);
      expect(item.selections).assertEqual('second_47');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_47');
      expect(item.index).assertEqual(548);
      expect(item.hashIndex).assertEqual(548);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0049
     * @tc.name      testPhotosUserFileDataItemSecond0049
     * @tc.desc      Initializes second media item sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0049 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_48', ['s_a_48', 's_b_48'], 'second_device_48', 549);
      expect(item.selections).assertEqual('second_48');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_48');
      expect(item.index).assertEqual(549);
      expect(item.hashIndex).assertEqual(549);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0050
     * @tc.name      testPhotosUserFileDataItemSecond0050
     * @tc.desc      Initializes second media item sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0050 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_49', ['s_a_49', 's_b_49'], 'second_device_49', 550);
      expect(item.selections).assertEqual('second_49');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_49');
      expect(item.index).assertEqual(550);
      expect(item.hashIndex).assertEqual(550);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0051
     * @tc.name      testPhotosUserFileDataItemSecond0051
     * @tc.desc      Initializes second media item sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0051 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_50', ['s_a_50', 's_b_50'], 'second_device_50', 551);
      expect(item.selections).assertEqual('second_50');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_50');
      expect(item.index).assertEqual(551);
      expect(item.hashIndex).assertEqual(551);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0052
     * @tc.name      testPhotosUserFileDataItemSecond0052
     * @tc.desc      Initializes second media item sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0052 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_51', ['s_a_51', 's_b_51'], 'second_device_51', 552);
      expect(item.selections).assertEqual('second_51');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_51');
      expect(item.index).assertEqual(552);
      expect(item.hashIndex).assertEqual(552);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0053
     * @tc.name      testPhotosUserFileDataItemSecond0053
     * @tc.desc      Initializes second media item sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0053 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_52', ['s_a_52', 's_b_52'], 'second_device_52', 553);
      expect(item.selections).assertEqual('second_52');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_52');
      expect(item.index).assertEqual(553);
      expect(item.hashIndex).assertEqual(553);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0054
     * @tc.name      testPhotosUserFileDataItemSecond0054
     * @tc.desc      Initializes second media item sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0054 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_53', ['s_a_53', 's_b_53'], 'second_device_53', 554);
      expect(item.selections).assertEqual('second_53');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_53');
      expect(item.index).assertEqual(554);
      expect(item.hashIndex).assertEqual(554);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0055
     * @tc.name      testPhotosUserFileDataItemSecond0055
     * @tc.desc      Initializes second media item sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0055 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_54', ['s_a_54', 's_b_54'], 'second_device_54', 555);
      expect(item.selections).assertEqual('second_54');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_54');
      expect(item.index).assertEqual(555);
      expect(item.hashIndex).assertEqual(555);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0056
     * @tc.name      testPhotosUserFileDataItemSecond0056
     * @tc.desc      Initializes second media item sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0056 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_55', ['s_a_55', 's_b_55'], 'second_device_55', 556);
      expect(item.selections).assertEqual('second_55');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_55');
      expect(item.index).assertEqual(556);
      expect(item.hashIndex).assertEqual(556);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0057
     * @tc.name      testPhotosUserFileDataItemSecond0057
     * @tc.desc      Initializes second media item sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0057 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_56', ['s_a_56', 's_b_56'], 'second_device_56', 557);
      expect(item.selections).assertEqual('second_56');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_56');
      expect(item.index).assertEqual(557);
      expect(item.hashIndex).assertEqual(557);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0058
     * @tc.name      testPhotosUserFileDataItemSecond0058
     * @tc.desc      Initializes second media item sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0058 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_57', ['s_a_57', 's_b_57'], 'second_device_57', 558);
      expect(item.selections).assertEqual('second_57');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_57');
      expect(item.index).assertEqual(558);
      expect(item.hashIndex).assertEqual(558);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0059
     * @tc.name      testPhotosUserFileDataItemSecond0059
     * @tc.desc      Initializes second media item sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0059 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_58', ['s_a_58', 's_b_58'], 'second_device_58', 559);
      expect(item.selections).assertEqual('second_58');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_58');
      expect(item.index).assertEqual(559);
      expect(item.hashIndex).assertEqual(559);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0060
     * @tc.name      testPhotosUserFileDataItemSecond0060
     * @tc.desc      Initializes second media item sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0060 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_59', ['s_a_59', 's_b_59'], 'second_device_59', 560);
      expect(item.selections).assertEqual('second_59');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_59');
      expect(item.index).assertEqual(560);
      expect(item.hashIndex).assertEqual(560);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0061
     * @tc.name      testPhotosUserFileDataItemSecond0061
     * @tc.desc      Initializes second media item sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0061 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_60', ['s_a_60', 's_b_60'], 'second_device_60', 561);
      expect(item.selections).assertEqual('second_60');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_60');
      expect(item.index).assertEqual(561);
      expect(item.hashIndex).assertEqual(561);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0062
     * @tc.name      testPhotosUserFileDataItemSecond0062
     * @tc.desc      Initializes second media item sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0062 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_61', ['s_a_61', 's_b_61'], 'second_device_61', 562);
      expect(item.selections).assertEqual('second_61');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_61');
      expect(item.index).assertEqual(562);
      expect(item.hashIndex).assertEqual(562);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0063
     * @tc.name      testPhotosUserFileDataItemSecond0063
     * @tc.desc      Initializes second media item sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0063 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_62', ['s_a_62', 's_b_62'], 'second_device_62', 563);
      expect(item.selections).assertEqual('second_62');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_62');
      expect(item.index).assertEqual(563);
      expect(item.hashIndex).assertEqual(563);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0064
     * @tc.name      testPhotosUserFileDataItemSecond0064
     * @tc.desc      Initializes second media item sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0064 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_63', ['s_a_63', 's_b_63'], 'second_device_63', 564);
      expect(item.selections).assertEqual('second_63');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_63');
      expect(item.index).assertEqual(564);
      expect(item.hashIndex).assertEqual(564);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0065
     * @tc.name      testPhotosUserFileDataItemSecond0065
     * @tc.desc      Initializes second media item sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0065 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_64', ['s_a_64', 's_b_64'], 'second_device_64', 565);
      expect(item.selections).assertEqual('second_64');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_64');
      expect(item.index).assertEqual(565);
      expect(item.hashIndex).assertEqual(565);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0066
     * @tc.name      testPhotosUserFileDataItemSecond0066
     * @tc.desc      Initializes second media item sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0066 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_65', ['s_a_65', 's_b_65'], 'second_device_65', 566);
      expect(item.selections).assertEqual('second_65');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_65');
      expect(item.index).assertEqual(566);
      expect(item.hashIndex).assertEqual(566);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0067
     * @tc.name      testPhotosUserFileDataItemSecond0067
     * @tc.desc      Initializes second media item sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0067 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_66', ['s_a_66', 's_b_66'], 'second_device_66', 567);
      expect(item.selections).assertEqual('second_66');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_66');
      expect(item.index).assertEqual(567);
      expect(item.hashIndex).assertEqual(567);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0068
     * @tc.name      testPhotosUserFileDataItemSecond0068
     * @tc.desc      Initializes second media item sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0068 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_67', ['s_a_67', 's_b_67'], 'second_device_67', 568);
      expect(item.selections).assertEqual('second_67');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_67');
      expect(item.index).assertEqual(568);
      expect(item.hashIndex).assertEqual(568);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0069
     * @tc.name      testPhotosUserFileDataItemSecond0069
     * @tc.desc      Initializes second media item sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0069 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_68', ['s_a_68', 's_b_68'], 'second_device_68', 569);
      expect(item.selections).assertEqual('second_68');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_68');
      expect(item.index).assertEqual(569);
      expect(item.hashIndex).assertEqual(569);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0070
     * @tc.name      testPhotosUserFileDataItemSecond0070
     * @tc.desc      Initializes second media item sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0070 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_69', ['s_a_69', 's_b_69'], 'second_device_69', 570);
      expect(item.selections).assertEqual('second_69');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_69');
      expect(item.index).assertEqual(570);
      expect(item.hashIndex).assertEqual(570);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0071
     * @tc.name      testPhotosUserFileDataItemSecond0071
     * @tc.desc      Initializes second media item sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0071 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_70', ['s_a_70', 's_b_70'], 'second_device_70', 571);
      expect(item.selections).assertEqual('second_70');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_70');
      expect(item.index).assertEqual(571);
      expect(item.hashIndex).assertEqual(571);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0072
     * @tc.name      testPhotosUserFileDataItemSecond0072
     * @tc.desc      Initializes second media item sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0072 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_71', ['s_a_71', 's_b_71'], 'second_device_71', 572);
      expect(item.selections).assertEqual('second_71');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_71');
      expect(item.index).assertEqual(572);
      expect(item.hashIndex).assertEqual(572);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0073
     * @tc.name      testPhotosUserFileDataItemSecond0073
     * @tc.desc      Initializes second media item sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0073 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_72', ['s_a_72', 's_b_72'], 'second_device_72', 573);
      expect(item.selections).assertEqual('second_72');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_72');
      expect(item.index).assertEqual(573);
      expect(item.hashIndex).assertEqual(573);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0074
     * @tc.name      testPhotosUserFileDataItemSecond0074
     * @tc.desc      Initializes second media item sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0074 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_73', ['s_a_73', 's_b_73'], 'second_device_73', 574);
      expect(item.selections).assertEqual('second_73');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_73');
      expect(item.index).assertEqual(574);
      expect(item.hashIndex).assertEqual(574);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0075
     * @tc.name      testPhotosUserFileDataItemSecond0075
     * @tc.desc      Initializes second media item sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0075 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_74', ['s_a_74', 's_b_74'], 'second_device_74', 575);
      expect(item.selections).assertEqual('second_74');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_74');
      expect(item.index).assertEqual(575);
      expect(item.hashIndex).assertEqual(575);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0076
     * @tc.name      testPhotosUserFileDataItemSecond0076
     * @tc.desc      Initializes second media item sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0076 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_75', ['s_a_75', 's_b_75'], 'second_device_75', 576);
      expect(item.selections).assertEqual('second_75');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_75');
      expect(item.index).assertEqual(576);
      expect(item.hashIndex).assertEqual(576);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0077
     * @tc.name      testPhotosUserFileDataItemSecond0077
     * @tc.desc      Initializes second media item sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0077 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_76', ['s_a_76', 's_b_76'], 'second_device_76', 577);
      expect(item.selections).assertEqual('second_76');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_76');
      expect(item.index).assertEqual(577);
      expect(item.hashIndex).assertEqual(577);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0078
     * @tc.name      testPhotosUserFileDataItemSecond0078
     * @tc.desc      Initializes second media item sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0078 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_77', ['s_a_77', 's_b_77'], 'second_device_77', 578);
      expect(item.selections).assertEqual('second_77');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_77');
      expect(item.index).assertEqual(578);
      expect(item.hashIndex).assertEqual(578);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0079
     * @tc.name      testPhotosUserFileDataItemSecond0079
     * @tc.desc      Initializes second media item sample 79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0079 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_78', ['s_a_78', 's_b_78'], 'second_device_78', 579);
      expect(item.selections).assertEqual('second_78');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_78');
      expect(item.index).assertEqual(579);
      expect(item.hashIndex).assertEqual(579);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0080
     * @tc.name      testPhotosUserFileDataItemSecond0080
     * @tc.desc      Initializes second media item sample 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0080 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_79', ['s_a_79', 's_b_79'], 'second_device_79', 580);
      expect(item.selections).assertEqual('second_79');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_79');
      expect(item.index).assertEqual(580);
      expect(item.hashIndex).assertEqual(580);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0081
     * @tc.name      testPhotosUserFileDataItemSecond0081
     * @tc.desc      Initializes second media item sample 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0081 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_80', ['s_a_80', 's_b_80'], 'second_device_80', 581);
      expect(item.selections).assertEqual('second_80');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_80');
      expect(item.index).assertEqual(581);
      expect(item.hashIndex).assertEqual(581);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0082
     * @tc.name      testPhotosUserFileDataItemSecond0082
     * @tc.desc      Initializes second media item sample 82.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0082 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_81', ['s_a_81', 's_b_81'], 'second_device_81', 582);
      expect(item.selections).assertEqual('second_81');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_81');
      expect(item.index).assertEqual(582);
      expect(item.hashIndex).assertEqual(582);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0083
     * @tc.name      testPhotosUserFileDataItemSecond0083
     * @tc.desc      Initializes second media item sample 83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0083 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_82', ['s_a_82', 's_b_82'], 'second_device_82', 583);
      expect(item.selections).assertEqual('second_82');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_82');
      expect(item.index).assertEqual(583);
      expect(item.hashIndex).assertEqual(583);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0084
     * @tc.name      testPhotosUserFileDataItemSecond0084
     * @tc.desc      Initializes second media item sample 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0084 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_83', ['s_a_83', 's_b_83'], 'second_device_83', 584);
      expect(item.selections).assertEqual('second_83');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_83');
      expect(item.index).assertEqual(584);
      expect(item.hashIndex).assertEqual(584);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0085
     * @tc.name      testPhotosUserFileDataItemSecond0085
     * @tc.desc      Initializes second media item sample 85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0085 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_84', ['s_a_84', 's_b_84'], 'second_device_84', 585);
      expect(item.selections).assertEqual('second_84');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_84');
      expect(item.index).assertEqual(585);
      expect(item.hashIndex).assertEqual(585);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0086
     * @tc.name      testPhotosUserFileDataItemSecond0086
     * @tc.desc      Initializes second media item sample 86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0086 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_85', ['s_a_85', 's_b_85'], 'second_device_85', 586);
      expect(item.selections).assertEqual('second_85');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_85');
      expect(item.index).assertEqual(586);
      expect(item.hashIndex).assertEqual(586);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0087
     * @tc.name      testPhotosUserFileDataItemSecond0087
     * @tc.desc      Initializes second media item sample 87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0087 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_86', ['s_a_86', 's_b_86'], 'second_device_86', 587);
      expect(item.selections).assertEqual('second_86');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_86');
      expect(item.index).assertEqual(587);
      expect(item.hashIndex).assertEqual(587);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0088
     * @tc.name      testPhotosUserFileDataItemSecond0088
     * @tc.desc      Initializes second media item sample 88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0088 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_87', ['s_a_87', 's_b_87'], 'second_device_87', 588);
      expect(item.selections).assertEqual('second_87');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_87');
      expect(item.index).assertEqual(588);
      expect(item.hashIndex).assertEqual(588);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0089
     * @tc.name      testPhotosUserFileDataItemSecond0089
     * @tc.desc      Initializes second media item sample 89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0089 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_88', ['s_a_88', 's_b_88'], 'second_device_88', 589);
      expect(item.selections).assertEqual('second_88');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_88');
      expect(item.index).assertEqual(589);
      expect(item.hashIndex).assertEqual(589);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0090
     * @tc.name      testPhotosUserFileDataItemSecond0090
     * @tc.desc      Initializes second media item sample 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0090 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_89', ['s_a_89', 's_b_89'], 'second_device_89', 590);
      expect(item.selections).assertEqual('second_89');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_89');
      expect(item.index).assertEqual(590);
      expect(item.hashIndex).assertEqual(590);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0091
     * @tc.name      testPhotosUserFileDataItemSecond0091
     * @tc.desc      Initializes second media item sample 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0091 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_90', ['s_a_90', 's_b_90'], 'second_device_90', 591);
      expect(item.selections).assertEqual('second_90');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_90');
      expect(item.index).assertEqual(591);
      expect(item.hashIndex).assertEqual(591);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0092
     * @tc.name      testPhotosUserFileDataItemSecond0092
     * @tc.desc      Initializes second media item sample 92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0092 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_91', ['s_a_91', 's_b_91'], 'second_device_91', 592);
      expect(item.selections).assertEqual('second_91');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_91');
      expect(item.index).assertEqual(592);
      expect(item.hashIndex).assertEqual(592);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_SECOND_0093
     * @tc.name      testPhotosUserFileDataItemSecond0093
     * @tc.desc      Initializes second media item sample 93.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemSecond0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0093 begin');
      const item: UserFileDataItem = new UserFileDataItem('second_92', ['s_a_92', 's_b_92'], 'second_device_92', 593);
      expect(item.selections).assertEqual('second_92');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('second_device_92');
      expect(item.index).assertEqual(593);
      expect(item.hashIndex).assertEqual(593);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemSecond0093 end');
