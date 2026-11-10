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
